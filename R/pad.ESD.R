# Extreme Studentized Deviate
#
# A terminer sur la base de :
#   http://www.jstor.org/stable/pdf/1268354.pdf
#   http://www.jstor.org/stable/pdf/1268549.pdf
#
# INPUT
#   ts: univariate time-serie
#   k: desired number of outliers
#   alpha: parameter
# OUTPUT
#   list of estimated anomalies (indexes)

pad.ESD <- function (ts, k = 10, alpha = 3) {
  ano = NULL
  continue = TRUE
  while (continue) {
    mean = mean(ts, na.rm = TRUE)
    sd = sd(ts, na.rm = TRUE)

    dif = abs(ts - mean) / sd
    maxval = max(dif, na.rm = T)
    maxind = which.max(dif)
    if (maxval > alpha) { # outlier detected
      ano = c(ano, maxind)
      ts[maxind] = NA
      if (length(ano) == k) { # enough outliers detected
        continue = FALSE
      }
    } else { # no more outlier
      continue = FALSE
    }
  }
  return (ano)
}
