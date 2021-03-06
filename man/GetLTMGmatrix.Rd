% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/LTMG.R
\name{GetLTMGmatrix}
\alias{GetLTMGmatrix}
\alias{.GetLTMGmatrix}
\alias{GetLTMGmatrix,IRISFGM-method}
\title{GetLTMGmatrix}
\usage{
GetLTMGmatrix(object, ...)

.GetLTMGmatrix(object)

\S4method{GetLTMGmatrix}{IRISFGM}(object)
}
\arguments{
\item{object}{Input IRIS-FGM object}

\item{...}{other arguments passed to methods}
}
\value{
It will reture LTMG signal matrix.
}
\description{
Get LTMG matrix
}
\examples{
data(example_object)
LTMG_signalmatrix <- GetLTMGmatrix(example_object)

}
