\name{regress}
\alias{regress}
\title{
  Create an object of either class regress or class regressMulti
}
\description{

  Conduct regression analysis for equity portfolio attribution. Create
  an object of either class \code{regression} for a single-period data set or
  class \code{regressionMulti} for a multi-period data set.  

}
\usage{

regress(x, date.var = "date", ret.var = "return", reg.var = c("sector",
"value", "growth"), benchmark.weight = "benchmark", portfolio.weight =
"portfolio")

}
\arguments{

  \item{x}{A data frame containing the data from which
    regression analysis will be conducted.}
  \item{date.var}{A character vector which indicates the name
    of the column in \code{x} to be used as a date for each
  observation. If the unique number of levels of \code{date.var} is one,
  a class object of \code{regression} will be formed. If it is more than
  one, a class object of \code{regressionMulti} will be formed.}  
  \item{ret.var}{A character vector which indicates the name of the
    column in \code{x} to be used as the return variable. }
  \item{reg.var}{Input variables to be used as independent variables in
    the regression analysis. }
  \item{benchmark.weight}{A character vector which indicates the name of the
    column or columns in \code{x} to be used as benchmark weight.}
  \item{portfolio.weight}{A character vector which indicates the name of the
    column or columns in \code{x} to be used as portfolio weight.}
  
}
\value{
  
  Return an object of class \code{regression} when there is only one
  unique date in the data frame \code{x}. Otherwise, an object of class
  \code{regressionMulti} is returned.

}
\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Single-period regression analysis

data(jan)

r1 <-regress(x = jan, date.var = "date", ret.var = "return", reg.var =
c("sector", "value", "growth"), benchmark.weight = "benchmark",
portfolio.weight = "portfolio")

summary(r1)

## Multi-period regression analysis

data(quarter)

r2 <-regress(x = quarter, date.var = "date", ret.var = "return", reg.var
= c("sector", "value", "growth"), benchmark.weight = "benchmark",
portfolio.weight = "portfolio")

summary(r2)

}
\keyword{file}
