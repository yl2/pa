\name{returns}
\alias{returns}
\title{Calculate the attribution results}

\description{

  Calculate and display the attribution results. Allocation effect,
  selection effect, interaction, and active return are displayed for
  brinson analysis. Returns of user-defined input variables, portfolio
  return, benchmark return, and active return are shown for regression
  analysis.
  
}

\usage{ returns(object, ...) }

\arguments{

  \item{object}{ An object of either class \code{brinson} or class
    \code{brinsonMulti}.} 
  \item{...}{Other options including {type} which refers to the
    type of returns to be shown for regression analysis. They
    include \code{arithmetic}, \code{geometric}, and \code{linking}.
    The default is \code{geometric}. }
}
  
\value{

  When the input is an object of class \code{brinson}, return a list of
  two matrices. The first one is the allocation, selection, and
  interaction for each groups in the specified category. The second
  matrix has 4 rows including \code{Allocation}, \code{Selection},
  \code{Interaction}, and \code{Active Return}.

  When the input is an object of class \code{brinsonMulti}, return a
  list including brison attribution for each individual period and the
  aggregate. 

  When the input is an object of class \code{regression}, return a
  matrix including contributions of input variables, \code{Portfolio
    Return}, \code{Benchmark Return}, and \code{Active Return}.

  When the input is an object of class \code{regressionMulti}, return a
  list including regression analysis for each individual period and the
  aggregate. 
  
}

\author{Yang Lu \email{Yang.Lu@williams.edu}}

\examples{

## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

returns(p1)

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

returns(p2, type = "linking")


}
\keyword{file}