% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/AddMeta.R
\name{PlotMeta}
\alias{PlotMeta}
\alias{.plotMeta}
\alias{PlotMeta,IRISFGM-method}
\title{PlotMeta}
\usage{
PlotMeta(object, ...)

.plotMeta(object = NULL)

\S4method{PlotMeta}{IRISFGM}(object = NULL)
}
\arguments{
\item{object}{input IRIS-FGM object}

\item{...}{other arguments passed to methods}
}
\value{
It will generate two violin plots regarding number of RNA count and identified gene number.
}
\description{
This function can plot figure based on numebr total count information and this step is for the quality control. we shoud exclude extreme value in data.
}
\examples{
x <- matrix(rnorm(100),ncol = 10) 
colnames(x) <- paste0("cell",1:ncol(x))
rownames(x) <- paste0("gene",1:nrow(x))
my_meta <- data.frame(row.names = paste0("cell",1:ncol(x)),
cluster = c(rep("ClusterA",5),rep("ClusterB",5)))
object <- CreateIRISFGMObject(x)
object <- AddMeta(object, 
meta.info = my_meta)
PlotMeta(object)
}
