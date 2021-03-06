\name{calc_ehh}
\alias{calc_ehh}
\title{EHH and iHH computations at a given core SNP}
\description{Compute Extended Haplotype Homozygosity (EHH) and integrated EHH (iHH) for a given focal SNPs.}
\usage{
calc_ehh(haplohh, mrk, limhaplo = 2, limehh = 0.05, maxgap=NA, plotehh = TRUE, 
    lty = 1, lwd = 1.5, col = c("blue", "red"), xlab = "Position", 
    ylab = expression(Extended ~ haplotype ~ homozygosity ~ (italic(EHH))), 
    cex.lab = 1.25, main = NA, cex.main = 1.5)
}
\arguments{
  \item{haplohh}{An object of class \code{haplohh} (see \code{data2haplohh}).}
  \item{mrk}{Integer representing the number of the focal marker}
  \item{limhaplo}{Minimal number of haplotypes to continue computing EHH away from the core SNP. Useless, if no missing data. However, when some data are missing, 
                  haplotypes with missing data are removed from the computation. Hence as we compute EHH further from the core SNP, less haplotypes are expected}
  \item{limehh}{Limit below which EHH stops to be evaluated}
  \item{maxgap}{Maximum allowed gap in bp between two SNPs below which EHH stops to be evaluated (default=NA, i.e., no limitation)}
  \item{plotehh}{If TRUE, EHH estimates for both the ancestral and derived allele are plotted for each position}
  \item{lty}{Line type for the ancestral and derived allele iHH (respectively) curves}
  \item{lwd}{Line width for the ancestral and derived allele iHH (respectively) curves}
  \item{col}{Color for the ancestral and derived allele iHH (respectively) curves}
  \item{xlab}{Legend for the x--axis}
  \item{ylab}{Legend for the y--axis}
  \item{cex.lab}{Size of the axis legend}
  \item{main}{Main legend of the EHHS plot}
  \item{cex.main}{Size of the main legend}
}

\details{
EHH are computed at each position upstream and downstream the focal SNP for both the derived and ancestral allele. This allows
in turn the computation of the integrated EHH relative to map distances (iHH).
}
\value{
  The returned value is a list containing the
  following components:
  \item{ehh}{A matrix of two rows and nsnps columns containing EHH estimates at each chromosome position relative to the focal SNP for the ancestral (first row) and derived (second row) alleles.}
  \item{nhaplo_eval}{A matrix of two rows and nsnps columns containing the number of evaluated haplotypes at each chromosome position relative to the focal SNP for the ancestral (first row) and derived (second row) alleles.}
  \item{ihh}{A vector of two elements corresponding respectively to the iHH (integrated EHH) for the ancestral and derived allele.}
}
\references{
   Gautier, M. and Naves, M. (2011). Footprints of selection in the ancestral admixture of a New World
   Creole cattle breed. \emph{Molecular Ecology}, \bold{20}, 3128--3143.

   Sabeti, P.C. et al. (2002). Detecting recent positive selection in the human genome 
   from haplotype structure. \emph{Nature}, \bold{419}, 832--837.

   Sabeti, P.C. et al. (2007). Genome-wide detection and characterization of positive selection in 
   human populations. \emph{Nature}, \bold{449}, 913--918.

   Tang, K. and Thornton, K.R. and Stoneking, M. (2007). A New Approach for Using Genome Scans
   to Detect Recent Positive Selection in the Human Genome. \emph{Plos Biology}, \bold{7}, e171.

   Voight, B.F. and Kudaravalli, S. and Wen, X. and Pritchard, J.K. (2006). 
   A map of recent positive selection in the human genome. \emph{Plos Biology}, \bold{4}, e72.
}
\seealso{calc_ehhs,data2haplohh,scan_hh}
\examples{
#example haplohh object (280 haplotypes, 1424 SNPs)
#see ?haplohh_cgu_bta12 for details
data(haplohh_cgu_bta12) 

#computing EHH statisitics for the focal SNP at position 456
# which displays a strong signal of selection
res.ehh<-calc_ehh(haplohh_cgu_bta12,mrk=456)
}
