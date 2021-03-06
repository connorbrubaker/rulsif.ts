% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RelULSIF.R
\name{RelULSIF}
\alias{RelULSIF}
\title{Relative unconstrained least squares importance fitting}
\usage{
RelULSIF(
  Xnu,
  Xde,
  Xce = NULL,
  sigma = NULL,
  lambda = NULL,
  alpha = 0.01,
  k = 100,
  n_folds = 5
)
}
\arguments{
\item{Xnu}{Samples from numerator probability density}

\item{Xde}{Samples from denomenator probability density}

\item{Xce}{Matrix of centers}

\item{sigma}{Scalar or vector; Gaussian kernel bandwidth(s). Positive.}

\item{lambda}{Scalar or vector; regularization parameter(s). Non-negative.}

\item{alpha}{Scalar; relative parameter in [0, 1)}

\item{k}{Positive integer; number of basis functions}

\item{n_folds}{Integer; number of folds to use in cross fold validation}
}
\value{
List of 3
\itemize{
\item opt_sigma: chosen sigma from CV
\item opt_lambda: chosen lambda from CV
\item rPE: relative Pearson divergence
}
}
\description{
Estimate the ratio of probability densities that generated
data in two samples (Xnu and Xde).
}
\examples{
X <- matrix(
    c(rnorm(50), rnorm(50, mean = 5), rnorm(50, mean = -5),
    rnorm(100), rnorm(25, mean = 3), rnorm(25, mean = -1),
    rnorm(25), rnorm(75, mean = -2), rnorm(50, mean = 4)),
    nrow = 3, ncol = 150, byrow = TRUE
)
Xnu <- X[ , 1:50]
Xde <- X[ , 51:ncol(X)]
RelULSIF(Xnu, Xde)
}
