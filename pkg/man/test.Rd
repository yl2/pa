\name{test}
\alias{test}
\docType{data}
\title{
  A sample portfolio edited based on Barra data set in Jan. 2010.
}
\description{
  An edited version of the data set based on Barra GEM2 data set in year
  2010. 
}
\usage{data(jan)}
\format{
  A data frame with 3000 observations on the following 6 variables.
  \describe{
    \item{\code{name}}{name of a security}
    \item{\code{return}}{a numeric vector}
    \item{\code{date}}{a Date}
    \item{\code{sector}}{an ordered factor with levels \code{Energy} < \code{Materials} < \code{Industrials} < \code{ConDiscre} < \code{ConStaples} < \code{HealthCare} < \code{Financials} < \code{InfoTech} < \code{TeleSvcs} < \code{Utilities}}
    \item{\code{portfolio}}{a numeric vector}
    \item{\code{benchmark}}{a numeric vector}
  }
}
\details{
  
  A edited version of the data set \code{jan}. \code{test} contains all the
  information necessary to conduct a single-period Brinson
  analysis. \code{date.var}, \code{cat.var}, and \code{return} identify
  the columns containing the date, the factor to be analyzed, and the
  return variable, respectively. \code{bench.weight} and
  \code{portfolio.weight} specify the name of the benchmark weight
  column and that of the portfolio weight column in the data frame. 

  In the paper, we use this data set to showcase that the Brinson model
  is a special case of the regression approach.

  In this data set, the universe of the portfolio is assumed to be the
  same as the benchmark. 
  
}

\examples{
data(test)
head(test)
}
\keyword{datasets}
