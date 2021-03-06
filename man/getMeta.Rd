% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/AddMeta.R
\name{getMeta}
\alias{getMeta}
\alias{.getmeta}
\alias{getMeta,IRISFGM-method}
\title{getMeta}
\usage{
getMeta(object)

.getmeta(object)

\S4method{getMeta}{IRISFGM}(object)
}
\arguments{
\item{object}{input IRISFGM object}
}
\value{
this function will reture the meta information for IRISFGM object.
}
\description{
Obtain meta information from IRISFGM object
}
\examples{
data(example_object)
meta_infor <- getMeta(example_object)
}
