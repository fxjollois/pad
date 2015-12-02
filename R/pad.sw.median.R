#' Point anomaly detection using sliding window median
#'
#' a value $t_i$ is considered as an anomaly if \eqn{abs(t_i - m_i) > threshold}, where \eqn{m_i}
#' is the median of the neighborhood of \eqn{i} defined with the following (where \eqn{k = size}):
#' \describe{
#'   \item{\code{two-sided}}{\eqn{m_i = median(t_(i-k), ..., t_(i+k))}, then \eqn{t_i} is inside}
#'   \item{\code{one-sided}}{\eqn{m_i = median(t_(i-2k), ..., t_(i-1))}, then \eqn{t_i} is outside}
#' }
#'
#' @param ts An univariate time series
#' @param side Choose between \code{one-sided} or \code{two-sided}
#' @param size Size of the sliding window
#' @param threshold 
#' 
#' @return Vector of estimated anomalies (indexes)
#' 
#' @seealso \code{\link{pad}}
#' 
#' @references
#'   % bibentry: Basu2007

pad.sw.median <- function (ts, side = "one-sided", size = 10, threshold = 1) {
  if (threshold <= 0) {
    stop("Threshold must be positive.")
  }
  if (size > length(ts) / 4) { # size must be less than 25% of the length of ts
    stop("Size too large.")
  }
  if (side == "two-sided") {
    ano = rollapply(ts,
                    width = 1 + 2 * size,
                    align = "center",
                    fill = FALSE,
                    function(seg) {
                      val = seg[length(seg) / 2 + 0.5]
                      med = median(seg, na.rm = TRUE)
                      return (abs(val - med) > threshold)
                    })
    return (which(ano))
  }
  if (side == "one-sided") {
    ano = rollapply(ts,
                    width = 1 + 2 * size,
                    align = "right",
                    fill = FALSE,
                    function(seg) {
                      val = seg[length(seg)]
                      med = median(seg[-length(seg)], na.rm = TRUE)
                      return (abs(val - med) > threshold)
                    })
    return (which(ano))
  }
  stop("Wrong side name for SWM method.")
}
