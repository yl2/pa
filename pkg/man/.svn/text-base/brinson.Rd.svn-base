\name{brinson}
\alias{brinson}
\title{Creating an object of either class brinson or class brinsonMulti}

\description{
  Conduct Brinson analysis for equity portfolio attribution. Create a
  class object of either \code{brinson} for a single-period data set or
  \code{brinsonMulti} for a multi-period data set.
}

\usage{
brinson(x, date.var = "date", cat.var = "sector", bench.weight =
"benchmark", portfolio.weight = "portfolio", ret.var = "return") 
}

\arguments{
  \item{x}{A data frame containing the data from which
    brinson analysis will be conducted.}
  \item{date.var}{A character vector which indicates the name
    of the column in \code{x} to be used as a date for each
  observation. If the unique number of levels of \code{date.var} is one,
  a class object of \code{brinson} will be formed. If it is more than
  one, a class object of \code{brinsonMulti} will be formed.}  
  \item{cat.var}{A character vector which indicates the name of the
    column in \code{x} to be used as categorical variables.}
  \item{bench.weight}{A character vector which indicates the name of the
    column or columns in \code{x} to be used as benchmark weight.}
  \item{portfolio.weight}{A character vector which indicates the name of the
    column or columns in \code{x} to be used as portfolio weight.}
  \item{ret.var}{A character vector which indicates the name of the
    column in \code{x} to be used as return variable.}
}

\value{

  Return an object of class \code{brinson} when there is only one unique
  date in the data frame \code{x}. Otherwise, an object of class
  \code{brinsonMulti} is returned.

}

\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

summary(p1)

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

summary(p2)

}
\keyword{file}
