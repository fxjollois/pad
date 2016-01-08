#' Plotting pad object
#' 
#' @param pad object of class \code{pad}
# usefulll functionnalities

plot.pad <- function (pad) {
  opar = par(mar = c(2, 2, 2, 0) + 0.1)
  plot(pad$ts, type = "l")
  points(pad$anomalies, pad$ts[pad$anomalies], col = "red", cex = 2, lwd = 2)
  par(opar)
}
