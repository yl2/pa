\name{plot-methods}
\docType{methods}
\alias{plot-methods}
\alias{plot,ANY,ANY-method}
\alias{plot,brinson,missing-method}
\alias{plot,brinsonMulti,missing-method}
\alias{plot,regression,missing-method}
\alias{plot,regressionMulti,missing-method}

\title{Plot the exposure or the return of a brinson, brinsonMulti,
  regression or regressionMulti object}

\description{

  This method plots the exposure or return comparison graph of a
  portfolio and its benchmark based on a portfolio class object.

}

\section{Methods}{

  \describe{

    \item{\code{signature(x = "ANY", y = "ANY")}}{
      The usual plot method from the base package.
    }
    
    \item{\code{signature(x = "brinsonMulti", y = "missing")}}{
      
      The \code{x} must be a \code{brinsonMulti} class object.
    
      The \code{var} can be used to specified the factor whose exposure to
      be shown. \code{sector} is the default setting where the exposure
      comparison graph based on sectors will be shown.
      
      The \code{type} can be either \code{exposure} or \code{return}. The
      default setting is \code{exposure}. When the \code{type} is set to
      \code{return}, the \code{var} option is no longer in use.
      
    }
    
    \item{\code{signature(x = "brinson", y = "missing")}}{
      
      The \code{x} must be a \code{brinson} class object.
      
      The \code{var} can be used to specified the factor whose exposure to
      be shown. \code{sector} is the default setting where the exposure
      comparison graph based on sectors will be shown.
      
      The \code{type} can be either \code{exposure} or \code{return}. The
      default setting is \code{exposure}. When the \code{type} is set to
      \code{return}, the \code{var} option is no longer in use.
      
    }
    
    \item{\code{signature(x = "regressionMulti", y = "missing")}}{
      
      The \code{x} must be a \code{regressionMulti} class object.
      
      The \code{var} can be used to specified the factor whose exposure to
      be shown. \code{sector} is the default setting where the exposure
      comparison graph based on sectors will be shown.
      
      The \code{type} can be either \code{exposure} or \code{return}. The
      default setting is \code{exposure}. When the \code{type} is set to
      \code{return}, the \code{var} option is no longer in use.
      
    }
    
  \item{\code{signature(x = "regression", y = "missing")}}{
    
    The \code{x} must be a \code{regression} class object.
    
    The \code{var} can be used to specified the factor whose exposure to
    be shown. \code{sector} is the default setting where the exposure
    comparison graph based on sectors will be shown.
    
    The \code{type} can be either \code{exposure} or \code{return}. The
    default setting is \code{exposure}. When the \code{type} is set to
    \code{return}, the \code{var} option is no longer in use.
    
  }
  
}  

}

\keyword{methods}