# determine outlier from Standard Deviation
#
# a value t_i is considered as an anomaly if  it is outside
# the interval [ mean - alpha * sd ; mean + alpha * sd ]
#
# INPUT
#   ts: univariate time-serie
#   alpha: parameter
# OUTPUT
#   list of estimated anomalies (indexes)

pad.SD <- function (ts, alpha = 3) {
  mean = mean(ts, na.rm = TRUE)
  sd = sd(ts, na.rm = TRUE)
  ano = which(abs(ts - mean) > alpha * sd)
  return (ano)
}
