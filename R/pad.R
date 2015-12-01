# Detection functionnalities
#
# INPUT
#   ts: univariate time-serie
#   method: method to use to detect anomalies
#   ...: parameters for the specified method
# OUTPUT
#   list of class "pad", including two vectors :
#     ts: original time-serie
#     anomalies: estimated anomalies (indexes)

pad <- function (ts, method, ...) {
  ano = NULL
  if (!is.vector(ts)) {
    stop("ts must be a vector.")
  }
  if (!is.numeric(ts)) {
    stop("ts must be numeric.")
  }
  methods = c("ESD", "SD", "SWMed")
  if (is.na(match(method, methods))) {
    stop("Wrong method name.")
  }
  ano = eval(parse(text = paste("pad.", method, "(ts, ...)", sep = "")))
  res = list(ts = ts, anomalies = ano)
  class(res) = "pad"
  return (res)
}



