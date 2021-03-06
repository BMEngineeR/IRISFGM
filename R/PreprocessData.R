#' @include generics.R
NULL

#' Process data
#'
#' @description  Process data via normalization and imputation.
#'
#' @param object Input IRISFGM object
#'
#' @param normalization two options: (1)library size noralization by using library size factor: 1e6, equal to CPM (count-per-million-reads), or 
#' (2) using 'scran' normalization method.
#' @param IsImputation imputation method is provided by DrImpute. Default is FALSE.
#' @param library.size Sets the scale factor for cpm normalization
#' @return It will processdata by normalization and imputation.
#' @name ProcessData
#'
#' @importFrom scater normalize logNormCounts
#' @importFrom SingleCellExperiment SingleCellExperiment normcounts
#' @importFrom scran quickCluster computeSumFactors
#' @importFrom Seurat as.sparse
#' @importFrom DrImpute DrImpute
#' @import methods
#' @import grDevices
#' @import graphics
#' @import utils
#' @import knitr
#' @examples  
#' data("example_object")
#' example_object <- ProcessData(example_object,
#' normalization = "cpm")
.processData <- function(object = NULL, 
                         normalization = "cpm", 
                         library.size = 1e+05, 
                         IsImputation = FALSE) {
    if (is.null(object@MetaInfo)) {
        stop("Can not find meta data, please run AddMeta")
    }
    Input <- object@Raw_count[, rownames(object@MetaInfo)]
    #set.seed(seed)
    random.number <- sample(c(seq_len(nrow(Input))), 100)
    if (all(as.numeric(unlist(Input[random.number, ]))%%1 == 0)) {
        ## normalization##############################
        if (grepl("cpm", ignore.case = TRUE, normalization)) {
            my.normalized.data <- (Input/colSums(Input)) * library.size
        } else if (grepl("scran", ignore.case = TRUE, normalization)) {
            sce <- SingleCellExperiment(assays = list(counts = Input))
            clusters <- quickCluster(sce, min.size = floor(ncol(Input)/3))
            sce <- computeSumFactors(sce, clusters = clusters)
            sce <- scater::logNormCounts(sce, log = FALSE)
            my.normalized.data <- normcounts(sce)
        }
    } else {
        my.normalized.data <- Input
        
    }
    
    ## imputation#################################
    if (IsImputation == TRUE) {
        my.imputated.data <- DrImpute(as.matrix(my.normalized.data), dists = "spearman")
    } else {
        my.imputated.data <- my.normalized.data
    }
    colnames(my.imputated.data) <- colnames(Input)
    rownames(my.imputated.data) <- rownames(Input)
    object@Processed_count <- my.imputated.data
    return(object)
}


#' @export
#' @rdname ProcessData
setMethod("ProcessData", "IRISFGM", .processData)





