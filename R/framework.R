# framework
framework <- function () {
  plot.pad(x)

  res = pad(x$ts, method = "SD", alpha = 1)
  comp = comparison(x$ts, x$anomalies, res$anomalies)
  print(comp$confusionMatrix)

  res = pad(x$ts, method = "SWM")
  comp = comparison(x$ts, x$anomalies, res$anomalies)
  print(comp$confusionMatrix)

  res = pad(x$ts, method = "SWM", side = "one-sided", threshold = 0.1)
  comp = comparison(x$ts, x$anomalies, res$anomalies)
  print(comp$confusionMatrix)

  plot(res)
}
