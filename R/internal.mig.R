
#' Internal migration flows between census years, in New Zealand, 1996-2013.
#'
#' The data come from the "address 5 year ago" question in the population
#' census.  \code{"region_orig"} is the person's region 5 years before
#' the census, and \code{"region_dest"} is the person's region
#' at the time of the census.  The counts have been rounded to
#' multiples of 3.  Counts below 6 are suppressed in the original data,
#' to preserve confidentiality.  Values for these counts have been imputed,
#' by fitting a loglinear model to the data, and then randomly drawing
## 0's and 3's, based on the fitted totals.
#'
#' @format An array with dimensions "age", "sex", "region_orig",
#' "region_dest", and "time"
#'
#' @source Custom tabulation from Statistics New Zealand.
#'
"internal.mig"
