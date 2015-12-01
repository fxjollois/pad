\name{x}
\alias{x}
\docType{data}
\title{Sample time serie with outliers}
\description{
everything is said...
}
\usage{x}
\format{A list with two vectors:
  \describe{
    \item{ts}{A time serie of 100 values, generated with runif(100), and where values 25, 50, 75 are respectively equal to 3, 4 and 5}
    \item{anomalies}{A vector containing the indexes of the three outliers (25, 50 and 75)}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
plot(x$ts, type = "l")
abline(v = x$anomalies, col = "red")
}
\keyword{datasets}
