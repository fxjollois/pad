# sliding window median (from Busa and Meckesheimer, 2007)
#
# a value t_i is considered as an anomaly if abs(t_i - m_i) > threshold, where m_i
# is the median of the neighborhood of i defined with the following :
#   two-sided: m_i = median(t_(i-k), ..., t_(i+k))   -> t_i is inside
#   one-sided: m_i = median(t_(i-2k), ..., t_(i-1))  -> t_i is outside
#
# INPUT
#   ts: univariate time-serie
#   alpha: parameter
# OUTPUT
#   list of estimated anomalies (indexes)

pad.SWMed <- function (ts, side = "one-sided", size = 10, threshold = 1) {
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
