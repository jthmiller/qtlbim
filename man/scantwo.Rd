\name{qb.scantwo}
\alias{qb.scantwo}
\title{Genome Scan for Pairs of Loci Involved in Phenotypic Trait}
\description{
This method extracts iteration diagnostics and pair loci from the
\code{qb} object and returns a data frame (of class \code{qb.scanone})
containing information on environmental variance, explained variance
components, epistatic and non-epistatic variance components.
}
\usage{
qb.scantwo(qbObject, epistasis = TRUE, scan, type.scan,
  upper.scan = "epistasis", lower.scan = "full", covar,
  adjust.covar, chr, min.iter = 1, verbose = FALSE, \dots)
}
\arguments{
  \item{qbObject}{An object of class \code{qb}.}
  \item{epistasis}{If \code{TRUE} information on epistasis is included
    in the return value.}
  \item{scan}{List of diagnostics to scan (see below).}
  \item{type.scan}{Vector of two scan types; default is "heritability" (see below).}
  \item{upper.scan}{Vector of diagnostics to scan for upper triangle
    (see below).}
  \item{lower.scan}{Vector of diagnostics to scan for lower triangle
    (see below).}
  \item{covar}{Covariate(s) to include; default is \code{seq(nfixcov)}
    where \code{nfixcov} is taken from \code{\link{qb.data}}. Set to 0
    to exclude any covariates.}
  \item{adjust.covar}{Adjustments to covariates. Default is
    \code{NA}, which adjusts by covariate mean values. Values are
    assumed to be in order of fixed covariates.}
  \item{chr}{Chromosomes to subset on if not \code{NULL}.}
  \item{min.iter}{Include only samples at loci if minimum number of
    iterations is at least \code{min.iter}; default is to include all
    (\code{min.iter} = 1).}
  \item{verbose}{Give verbose feedback if \code{TRUE}.}
  \item{\dots}{Additional arguments mostly ignored.}
}
\value{
Returns an object of class \code{qb.scantwo} (a data frame) containing
effects selected according to \code{type.scan} and \code{scan}.
}
\details{
The \code{scan} and \code{type.scan} are similar to those used in
\code{\link{qb.scanone}}. However, here \code{scan} is a list and
\code{type.scan} is a vector, each with elements "lower" and "upper". You can
either specify \code{scan} as a list, or profide \code{upper.scan} and
\code{lower.scan} separately.

The \code{scan} defaults for types other than counts to \code{list(upper =
"epistasis", lower = "full")}; you can modify the list \code{scan} or
the separate options \code{upper.scan} and \code{lower.scan}. The string
"epistasis" is short-hand for the epistatic effects, \code{c("aa", "ad",
  "da", "dd")}. The string "full" is shorthand for the epistatics
effects plus main effects, \code{c("add", "dom")}, plus any GxE terms.

The \code{type.scan} defaults to \code{c(upper = "LPD", lower =
  "LPD")}. See \code{\link{qb.scanone}} for the range of possible
types. Mostly the 2-D version of \code{type.scan} provides marginal summaries
for pairs of loci. However, for type \code{"nqtl"}, the marginal summaries
involving main effects (e.g. with \code{scan} values \code{"full"} or
\code{"main"} or \code{"add"} or \code{"dom"}) show, for each pair of
chromosomes, the average number of QTL at both chromosomes.
}

\references{ \url{http://www.qtlbim.org} }
\author{ Brian S. Yandell, yandell@stat.wisc.edu }
\seealso{\code{\link{plot.qb.scanone}}}
\examples{
data(qbExample)

temp <- qb.scantwo(qbExample)
summary(temp)
plot(temp)
}
\keyword{models}
\keyword{hplot}


