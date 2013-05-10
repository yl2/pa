\name{brinsonMulti-class}
\docType{class}
\alias{brinsonMulti-class}

\alias{show,brinsonMulti-method}
\alias{summary,brinsonMulti-method}
\alias{exposure,brinsonMulti-method}
\alias{returns,brinsonMulti-method}
\alias{plot,brinsonMulti-method}

\title{Class "brinsonMulti"}
\description{ Class "brinsonMulti" holds the results of an original
  portfolio, its benchmark, and the results of brinson analysis of a
  multi-period portfolio. }

\section{Slots}{
  \describe{
    \item{\code{date.var}:}{ Object of class character storing all the
      dates occurred in the universe data frame.}
    \item{\code{cat.var}:}{ Object of class character storing the
      variable name of the categories in the universe data frame.}
    \item{\code{bench.weight}:}{ Object of class character storing the
      benchmark weight variable name in the universe data frame.}
    \item{\code{portfolio.weight}:}{ Object of class character storing the
      portfolio weight variable name in the universe data frame.}
    \item{\code{ret.var}:}{ Object of class character storing the return
      variable name in the universe data frame.}
    \item{\code{weight.port}:}{ Object of class matrix storing the
      sector weights of the original portfolio.}
    \item{\code{weight.bench}:}{ Object of class matrix storing the
      sector weights of the benchmark portfolio.}
    \item{\code{ret.port}:}{ Object of class matrix storing the
      sector returns of the original portfolio.}
    \item{\code{ret.bench}:}{ Object of class matrix storing the
      sector returns of the benchmark portfolio.}
    \item{\code{brinson.mat}:}{ Object of class matrix storing the information
      of the brinson matrix across period. }
    \item{\code{universe}:}{ Data frame storing the universe
      environment. }
    
  }
}

\section{Methods}{
\describe{
  \item{\code{show}}{\code{signature(object = "brinson")}. Summarize
    the essential information about the portfolio.}
  \item{\code{summary}}{\code{signature(object = "brinson")}. Summarize
    the portfolio and the brinson analysis.}
  \item{\code{exposure}}{\code{signature(object = "brinson")}. Calculate and
    display the sector exposure of a portfolio. }
  \item{\code{returns}}{\code{signature(object = "brinson")}. Calculate the
    contribution of various effects based on the brinson model. }
  \item{\code{plot}}{\code{signature(x = "brinson", var = "character",
    type = "character")}. Plot the exposure or the return of a portfolio
  class object. }
}
}

\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Multi-period brinson analysis
data(quarter)
p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var = "return")
summary(p2)

}


\keyword{classes}