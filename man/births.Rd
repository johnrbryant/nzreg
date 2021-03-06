% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/births.R
\docType{data}
\name{births}
\alias{births}
\title{Registered births in New Zealand by age, sex, and region, 1997-2016.}
\format{An array with dimensions "age", "sex", "region", and "year"}
\source{
Custom tabulation from Statistics New Zealand.
}
\usage{
births
}
\description{
The \code{"age"} variable refers to the age of the mother, and the \code{"sex"}
variable refers to the sex of the child.
}
\details{
The years are June years.  For instance, the year "1997" runs from 1 July 1996
to 30 Jun 1997.

To preserve confidentiality, birth counts have been randomly rounded to base 3.

Births to mothers aged less than 15 have been included in age group
\code{"15-19"}, and all births to mothers aged
50 or higher have been included in age group \code{"45-49"}.
}
\keyword{datasets}
