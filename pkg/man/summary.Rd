\name{summary}
\alias{summary}
\title{Provide a summary for Brinson or regression analysis}

\description{

  Summarize a portfolio and its benchmark. Present the attribution
  information including basic portfolio information, expsosures, and
  returns. The input can be any of the four class objects including
  \code{brinson}, \code{brinsonMulti}, \code{regression}, and
  \code{regressionMulti}. 

}

\usage{ summary(object, ...) }

\arguments{

  \item{object}{ An object of \code{brinson}, \code{brinsonMulti},
    \code{regression} or \code{regressionMulti}.}
  \item{...}{ Other options.}
}

\value{

  Return relevant information about a portfolio and its benchmark. It
  includes their exposures based on input categories (for Brinson
  analysis only) and the results of either Brinson analysis or
  regression analysis. 
  
}

\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

summary(p1)

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

summary(p2)

}
\keyword{file}