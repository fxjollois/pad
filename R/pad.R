#' Point Anomaly Detection
#' 
#' The \code{pad} function propose a wide range of methods to detect 
#' point anomalies in a univariate time-serie.
#'
#' @param ts An univariate time series
#' @param method Name of the desired method
#' @param ... Parameters for the specified method (see specific help for more details)
#' 
#' @return list of class \code{pad}, including two vectors :
#'   \item{\code{ts}}{original time series}
#'   \item{\code{anomalies}}{estimated anomalies (indexes)}
#' 
#' @export

# @example 
# pad(x$ts, "sw.median")

pad <- function (ts, method, ...) {
  ano = NULL
  if (!is.vector(ts)) {
    stop("ts must be a vector.")
  }
  if (!is.numeric(ts)) {
    stop("ts must be numeric.")
  }
  methods = c("esd", "sd", "sw.median")
  if (is.na(match(method, methods))) {
    stop("Wrong method name.")
  }
  ano = eval(parse(text = paste("pad.", method, "(ts, ...)", sep = "")))
  res = list(ts = ts, anomalies = ano)
  class(res) = "pad"
  return (res)
}



