% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matout.R
\name{matout}
\alias{matout}
\title{A Matrix Output Function}
\usage{
matout(X, name = "X", justify = "c", dig = 0)
}
\arguments{
\item{X}{a matrix}

\item{name}{a name for your matrix, defaults to X}

\item{justify}{should your matrix be left, right or centered? 
Takes the first letter as an argument and defaults to centered.}

\item{dig}{the number of digits to display. This is passed directly to xtable as a parameter.}
}
\description{
This function allows you to output a matrix from R in Latex format. It is nothing more than 
a wrapper for 'xtable'.
}
\examples{
set.seed(100)
matout( matrix(floor(runif(9,1,9)),ncol=3) )

matout( matrix(runif(9,1,9),ncol=3),dig=3)

## Greek letters can also be passed, just make sure to use the '$' to tell 
## Latex that you want to be in math mode.
matout( matrix(runif(9,1,9),ncol=3),dig=3,name="$\\\\Psi$")
}
\keyword{matrix}

