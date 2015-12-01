# Comparison fonctionnalities

comparison <- function (ts, obs, est) {
  # INPUT
  #   ts:   univariate time-serie
  #   obs:  list of observed anomalies
  #   est:  list of estimated anomalies
  # OUTPUT : list with following values
  #   confusionMatrix
  #   TP, TN, FP, FN
  TP = sum(est %in% obs) # True Positive
  FN = length(obs) - TP # False Negative
  FP = length(est) - TP # False Positive
  TN = length(ts) - TP - FN - FP # True Negative
  conf = matrix(c(TP, FP, FN, TN), 2, 2)
  rownames(conf) = c("obs T", "obs F")
  colnames(conf) = c("est T", "est F")
  result = list(confusionMatrix = conf,
                TP = TP, TN = TN, FP = FP, FN = FN)
  return (result)
}
