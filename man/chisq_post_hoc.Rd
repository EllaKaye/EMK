% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chisq_post_hoc.R
\name{chisq_post_hoc}
\alias{chisq_post_hoc}
\title{Tests for significant differences among all pairs of populations in a
chi-square test, correcting for multiple comparisons.}
\usage{
chisq_post_hoc(
  tbl,
  test = c("fisher.test"),
  popsInRows = TRUE,
  control = c("fdr", "BH", "BY", "bonferroni", "holm", "hochberg", "hommel"),
  digits = 4,
  printMethod = FALSE,
  ...
)
}
\arguments{
\item{tbl}{A \code{table} object.}

\item{test}{What sort of test will be used? This must have an object called p.value so it can correct the p-values. Defaults to "fisher.test"}

\item{popsInRows}{A logical indicating whether the populations form the rows
(default; \code{=TRUE}) of the table or not (\code{=FALSE}).}

\item{control}{A string indicating the method of control to use.  See
details.}

\item{digits}{A numeric that controls the number of digits to print.}

\item{printMethod}{Logical. Whether to print method by which p-values controlled.}

\item{\dots}{Other arguments sent to whatever test the user specifies.}
}
\value{
A data.frame with a description of the pairwise comparisons, the raw
p-values, and the adjusted p-values.
}
\description{
Tests for significant differences among all pairs of populations in a
chi-square test, correcting for multiple comparisons.
}
\details{
Post-hoc tests for which pairs of populations differ following a significant
chi-square test can be constructed by performing all chi-square tests for all
pairs of populations and then adjusting the resulting p-values for inflation
due to multiple comparisons.  The adjusted p-values can be computed with a
wide variety of methods -- fdr, BH, BY, bonferroni, holm, hochberg, and
hommel.  This function basically works as a wrapper function that sends the
unadjusted \dQuote{raw} p-values from each pair-wise chi-square test to the
\code{p.adjust} function in the base R program.  The \code{p.adjust} function
should be consulted for further description of the methods used.
}
\note{
This code was adapted and modified from the NCStats package
}
\examples{
# Makes a table of observations -- similar to first example in chisq.test
M <- as.table(rbind(c(76, 32, 46), c(48,23,47), c(45,34,78)))
dimnames(M) <- list(sex=c("Male","Female","Juv"),loc=c("Lower","Middle","Upper"))
M
# Shows post-hoc pairwise comparisons using fdr method
chisq_post_hoc(M)
}
\seealso{
\code{chisq.test} and \code{p.adjust}.
}
\keyword{htest}
