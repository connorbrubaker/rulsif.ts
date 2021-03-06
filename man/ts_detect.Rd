% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ts_detect.R
\name{ts_detect}
\alias{ts_detect}
\title{Change point detection}
\usage{
ts_detect(
  ts,
  window_size = 5,
  step = NULL,
  alpha = 0.05,
  k = 100,
  n_folds = 5,
  thresh = 0.9,
  make_plot = FALSE
)
}
\arguments{
\item{ts}{Time series to detect change points in. Assumes this is a D by N matrix
where D is the dimension of the time series and N is the number of
time points. If a vector is provided, will assume the time series is
one-dimensional.}

\item{window_size}{The length of the sub-sequences generated from the series. Default \code{5}.}

\item{step}{How many sub-sequences forward and backward to from a time point
to compute a score from. Default is 10\% of the length of the series
if not specified.}

\item{alpha}{Relative parameter in [0, 1). Default \code{0.05}. Setting to \code{0} recovers
ordinary unconstrained least squares importance fitting.}

\item{k}{Number of basis functions. Default is minimum of \code{100} and dimension of
the time series.}

\item{n_folds}{Number of folds to use in determining optimal kernel bandwidth
and lambda parameter in RULSIF.}

\item{thresh}{Scalar in (0, 1) indicating the percentile above which a score
is considered a potential change-point. Lower values increase
the sensitivity.}

\item{make_plot}{Logical. On the same figure, make a plot of each dimension
of the time series, the rPE scores, and highlight in the time
series plots the change points detected in red. Default \code{FALSE}.}
}
\value{
List of 3:
\itemize{
\item \code{step}: the step used
\item \code{scores}: rPE scores
\item \code{change_points}: time points that a change was detected at the given threshold
}
}
\description{
Detect change points in a time series using RelULSIF.
}
\examples{
s <- c(rnorm(150, mean = 0), rnorm(150, mean = 5), rnorm(150, mean = 1))
s <- matrix(s, nrow = 1)
ts_detect(s)
}
