\name{regressionMulti-class}
\Rdversion{1.1}
\docType{class}
\alias{regressionMulti-class}
\alias{exposure,regressionMulti-method}
\alias{plot,regressionMulti-method}
\alias{returns,regressionMulti-method}
\alias{show,regressionMulti-method}
\alias{summary,regressionMulti-method}

\title{Class "regressionMulti"}
\description{
  Class "regressionMulti" holds the results of an original portfolio,
  its benchmark, and the results of regression analysis of a
  multi-period portfolio.  
}
\section{Slots}{

  \describe{
    
    \item{\code{date.var}:}{Object of class \code{"character"} storing
      the date(s) in the class object.}

    \item{\code{ret.var}:}{Object of class \code{"character"} storing
      the name of the return variable. }

    \item{\code{reg.var}:}{Object of class \code{"character"} storing
      the name of the regressors. }

    \item{\code{benchmark.weight}:}{Object of class \code{"character"}
      storing the name of the benchmark weight variable. }

    \item{\code{portfolio.weight}:}{Object of class \code{"character"}
      storing the name of the portfolio weight variable in the universe
      dataframe. }
    
    \item{\code{coefficients}:}{Object of class \code{"matrix"} storing
      the estimated coefficients of the regression model for each time
      period. }
    
    \item{\code{benchmark.ret}:}{Object of class \code{"matrix"} storing
      the benchmark return of the input portfolio for each time
      period. }
    
    \item{\code{portfolio.ret}:}{Object of class \code{"matrix"} storing
      the portfolio return of the input portfolio for each time
      period. }
    
    \item{\code{act.ret}:}{Object of class \code{"matrix"} storing the
      active return of the input portfolio for each time period. }

    \item{\code{act.expo}:}{Object of class \code{"matrix"} storing the
      active exposure according to the regressors for each time
      period. }
    
    \item{\code{contrib}:}{Object of class \code{"matrix"} storing the
      contribution of the regressors according to the input for each
      time period. }

    \item{\code{universe}:}{Object of class \code{"list"} storing
      the entire input data frame. }
  }
}
\section{Methods}{
  \describe{

    \item{exposure}{\code{signature(object = "regressionMulti")}: Calculate
      and display the exposure of the input category of a portfolio. }

    \item{plot}{\code{signature(x = "regressionMulti", y = "missing")}:
      Plot the exposure or the return of a regressionMulti class object. }

    \item{returns}{\code{signature(object = "regressionMulti")}:
      Calculate the contribution of various effects based on the
      regression analysis. }

    \item{show}{\code{signature(object = "regressionMulti")}: Summarize
      the essential information about the portfolio.  }

    \item{summary}{\code{signature(object = "regressionMulti")}:
      Summarize the portfolio and the regression-based attribution. }

  }
}

\author{  Yang Lu  \email{yang.lu@williams.edu}}

\examples{

## Multi-period regression analysis

data(quarter)

r2 <-regress(x = quarter, date.var = "date", ret.var = "return", reg.var = c("sector",
"value", "growth"), benchmark.weight = "benchmark", portfolio.weight =
"portfolio")

summary(r2)

}

\keyword{classes}
