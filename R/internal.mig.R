
#' Internal migration flows between census years, in New Zealand, 1991-2013.
#'
#' The data come from the "address 5 year ago" question in the population
#' census.  \code{"region_orig"} is the person's region 5 years before
#' the census, and \code{"region_dest"} is the person's region
#' at the time of the census.  The counts have been rounded to
#' multiples of 3.  Counts below 6 are suppressed in the original data,
#' to preserve confidentiality.  Values for these counts have been imputed,
#' by fitting a loglinear model to the data, and then randomly drawing
#' 0's and 3's, based on the fitted totals.
#'
#' \code{age} means age at the start of the 5-year interval - not age at the
#' time of the census.
#'
#' @section Warning:
#' Censuses in New Zealand are generally carried out at 5-year intervals.
#' The 2011 Census was, however, delayed to 2013 because of an earthquake.
#' This means that there is a gap in the series between the periods
#' 2001-2006 and 2008-2013. If using the package \code{dembase},
#' it is necessary to override the defaults for function \code{Counts},
#' which assumes that time dimensions do not have gaps:
#'
#' \code{mig <- Counts(nzreg::internal.mig, dimtypes = c(time = "state"))}
#' 
#'
#' @format An array with dimensions "age", "sex", "region_orig",
#' "region_dest", and "time"
#'
#' @source Custom tabulation from Statistics New Zealand.
#'
"internal.mig"
