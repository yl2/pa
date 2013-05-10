\name{brinson-class}
\Rdversion{1.1}
\docType{class}
\alias{brinson-class}
\alias{exposure,brinson-method}
\alias{plot,brinson-method}
\alias{returns,brinson-method}
\alias{show,brinson-method}
\alias{summary,brinson-method}

\title{Class "brinson"}
\description{

  Class \code{brinson} holds the results of an original portfolio, its
  benchmark, and the results of Brinson analysis of a single-period
  portfolio.

}

\section{Slots}{
  \describe{
    
    \item{\code{date.var}:}{Object of class \code{"character"} storing
      the date variable name. }
    \item{\code{cat.var}:}{Object of class \code{"character"} storing the
      name(s) of the categories in the Brinson analysis. }
    \item{\code{bench.weight}:}{Object of class \code{"character"}
      storing the name of the benchmark weight variable. }
    \item{\code{portfolio.weight}:}{Object of class \code{"character"}
      storing the name of the portfolio weight variable in the universe
      data frame. }    
    \item{\code{ret.var}:}{Object of class \code{"character"} storing
      the name of the return variable. }
    \item{\code{weight.port}:}{Object of class \code{"array"} storing the
      weights of the input category of the portfolio. }
    \item{\code{weight.bench}:}{Object of class \code{"array"} storing the
      weights of the input category of the benchmark. }
    \item{\code{ret.port}:}{Object of class \code{"array"} storing the
      returns of the input category of the portfolio. }
    \item{\code{ret.bench}:}{Object of class \code{"array"} storing the
      returns of the input category of the benchmark. }
    \item{\code{q4}:}{Object of class \code{"numeric"} storing the
      information of the 4th quadrant in the brinson matrix. It refers
      to return of the benchmark portfolio. }
    \item{\code{q3}:}{Object of class \code{"numeric"} storing the
      information of the 3rd quadrant in the brinson matrix. It refers
      to return of the portfolio with benchmark sector weights and
      portfolio sector returns. }
    \item{\code{q2}:}{Object of class \code{"numeric"} storing the
      information of the 2nd quadrant in the brinson matrix. It refers
      to return of the portfolio with portfolio sector weights and
      benchmark sector returns.}
    \item{\code{q1}:}{Object of class \code{"numeric"} storing the
      information of the 1st quadrant in the brinson matrix. It refers
      to return of the original portfolio.}
    \item{\code{universe}:}{Object of class \code{"data.frame"} storing
      the data frame on which the Brinson attribution is based. }
  }
}

\section{Methods}{
  \describe{
    
    \item{\code{show}}{\code{signature(object = "brinson")}. Summarize
      the essential information about the portfolio.}
    
    \item{\code{summary}}{\code{signature(object = "brinson")}. Summarize
      the portfolio and the Brinson attribution.}
    
    \item{\code{exposure}}{\code{signature(object = "brinson")}. Calculate and
      display the exposure of the input category of a portfolio. }
    
    \item{\code{returns}}{\code{signature(object = "brinson")}. Calculate the
      contribution of various effects based on the Brinson analysis. }
    
    \item{\code{plot}}{\code{signature(x = "brinson", var = "character",
	type = "character")}. Plot the exposure or the return of a portfolio
      class object. }
  }
}
 
\author{Yang Lu  \email{yang.lu@williams.edu}}

\examples{

data(jan)

## Single-period brinson analysis

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

summary(p1)

exposure(p1, var = "sector")

returns(p1)

plot(p1, var = "sector", type = "exposure")

plot(p1, var = "sector", type = "return")

}


\keyword{classes}