\name{regression-class}
\Rdversion{1.1}
\docType{class}
\alias{regression-class}
\alias{exposure,regression-method}
\alias{plot,regression-method}
\alias{returns,regression-method}
\alias{show,regression-method}
\alias{summary,regression-method}

\title{Class "regression"}
\description{

  Class "regression" holds the results of an original portfolio, its
  benchmark, and the results of regression analysis of a single-period
  portfolio. 

}

\section{Slots}{
  
  \describe{

    \item{\code{date.var}:}{Object of class \code{"character"} storing
      the name of the date column in the class object. }
    
    \item{\code{ret.var}:}{Object of class \code{"character"} storing
      the name of the return variable. }

    \item{\code{reg.var}:}{Object of class \code{"character"} storing
      the name of the regressors. }
    
    \item{\code{benchmark.weight}:}{Object of class \code{"character"}
      storing the name of the benchmark weight variable. }

    \item{\code{portfolio.weight}:}{Object of class \code{"character"}
      storing the name of the portfolio weight variable in the universe
      dataframe. }
  
    \item{\code{coefficients}:}{Object of class \code{"numeric"} storing
      the estimated coefficients of the regression model. }
    
    \item{\code{benchmark.ret}:}{Object of class \code{"matrix"} storing
      the benchmark return of the input portfolio. }
    
    \item{\code{portfolio.ret}:}{Object of class \code{"matrix"} storing
      the portfolio return of the input portfolio. }
    
    \item{\code{act.ret}:}{Object of class \code{"matrix"} storing the
      active return of the input portfolio. }
    
    \item{\code{act.expo}:}{Object of class \code{"numeric"} storing the
      active exposure according to the regressors. }

    \item{\code{contrib}:}{Object of class \code{"numeric"} storing the
      contribution of the regressors according to the input. }
    
    \item{\code{universe}:}{Object of class \code{"data.frame"} storing
      the entire input data frame. }
  }
}

\section{Methods}{

  \describe{

    \item{exposure}{\code{signature(object = "regression")}: Calculate
      and display the exposure of the input category of a portfolio.}

    \item{plot}{\code{signature(x = "regression", y = "missing")}: Plot
      the exposure or the return of a regression class object. }

    \item{returns}{\code{signature(object = "regression")}: Calculate
      the contribution of various effects based on the regression
      analysis. }

    \item{show}{\code{signature(object = "regression")}: Summarize the
      essential information about the portfolio. }

    \item{summary}{\code{signature(object = "regression")}: Summarize
      the portfolio and the regression-based attribution. }
  }
}

\author{ Yang Lu \email{yang.lu@williams.edu} }

\examples{

## Single-period regression analysis

data(jan)

r1 <-regress(x = jan, date.var = "date", ret.var = "return", reg.var = c("sector",
"value", "growth"), benchmark.weight = "benchmark", portfolio.weight =
"portfolio")

summary(r1)

}

\keyword{classes}
