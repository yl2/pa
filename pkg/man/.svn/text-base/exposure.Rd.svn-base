\name{exposure}
\alias{exposure}
\title{Calculate and display the sector exposure of a portfolio}

\description{

  Calculate and display the exposure of a portfolio based on any given
  category. Both the portfolio and benchmark exposures are displayed.
  
}

\usage{

  exposure(object, var, ...)

}

\arguments{
  \item{object}{An object of either class \code{brinson} or class
  \code{brinsonMulti}.}  
  \item{var}{Any user-defined category whose exposure is to be
    displayed.}
  \item{...}{Other options.}
}

\value{

  Return a matrix if the input object is of class \code{brinson} with
  portfolio, benchmark exposures, and their differences, and return a
  list if the input object is of class \code{brinsonMulti} including
  portfolio, benchmark exposures, and their differences for each period.

  If the input \code{var} is categorical, it will show exposure of each
  sub-groups within the category. If the input \code{var} is continuous,
  it will show exposure of the category in quintiles.  
}

\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

exposure(p1, var = "size")

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

exposure(p2, var = "sector")

}
\keyword{file}