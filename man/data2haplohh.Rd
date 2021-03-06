\name{data2haplohh}
\alias{data2haplohh}
\title{Converting data into an object of class haplohh}
\description{Converts input file data into an object of class haplohh.}
\usage{
data2haplohh(hap_file,map_file,min_maf=0,min_perc_geno.hap=100,
min_perc_geno.snp=100,chr.name=NA,popsel=NA,recode.allele=FALSE,
haplotype.in.columns=FALSE)
}
\arguments{
  \item{hap_file}{Path to the file containing haplotype data (see details section below for information about input file format)}
  \item{map_file}{Path to the file containing map information (see details section below for information about input file format}
  \item{min_maf}{Threshold on Minor Allele Frequency (SNPs displaying a MAF lower than \code{min_maf} are discarded)}
  \item{min_perc_geno.hap}{Threshold on percentage of missing data for haplotypes (Haplotypes with less than \code{min_perc_geno.hap} percent SNPs genotyped are discarded). By default, \code{min_perc_geno.hap}=100, hence only fully genotyped haplotypes are retained}
  \item{min_perc_geno.snp}{Threshold on percentage of missing data for SNPs (SNPs genotyped on less than \code{min_perc_geno.snp} percent haplotypes are discarded). By default, \code{min_perc_geno.snp}=100, hence only fully genotyped SNPs are retained}
  \item{chr.name}{Name of the chromosome considered (relevant if several chromosomes are represented in the map file)}
  \item{popsel}{Code of the population considered in the fastPHASE output haplotype file (relevant if \code{hap_file} is a fastPHASE output and haplotypes originate from different population)}
  \item{recode.allele}{If TRUE, allele in the haplotypes are recoded according to the map file information. If FALSE a rough verification is performed to check only 0 (code for missing data), 1 (code for ancestral allele) or 2 (code for derived allele) are present in the haplotype file}
  \item{haplotype.in.columns}{If TRUE, phased input haplotypes are assumed to be in columns (as produced by the SHAPEIT2 program (O'Connell et al., 2014).
}
}
\details{
Three haplotype input formats are supported: i) a standard format with haplotype in row and snps in column (with no header and a haplotype id); ii) a (transposed) format similar to the one produced by the phasing program SHAPEIT2 program (O'Connell et al., 2014) in which haplotypes are in columns and snps in rows (with no header and no snp id); and iii) output files from fastPHASE program (Sheet and Stephens, 2006). If the input haplotypes are not in transposed format (i.e., \code{haplotype.in.columns} is FALSE, as by default), the function automatically checks if the file is in fastPHASE output format. In this latter case, if haplotypes originate from several different population were phased simultaneously (-u fastPHASE option was used), the function ask interactively which population should be considered (a list of population number are proposed) unless specified with the \code{popsel} argument.
Map file contains SNPs information in five columns SNP names, chromosome, position, ancestral and derived allele. SNPs must be in the same order as in the haplotype for the chromosome considered. If several chromosomes are represented in the map file, one can provide the name of the chromosome of interest (corresponding to the haplotype under study) with \code{chr.name} argument. Haplotype are recoded (if \code{recode.allele} option is activated) according to the ancestral and derived allele definition available in the map file (fourth and fifth columns) as :0=missing data, 1=ancestral allele, 2=derived allele. If such a coding is detected, no recoding is performed. Note that Rsb statistics does not consider ancestral and derived allele status information.
Finally, the arguments \code{min\_perc\_geno.hap}, \code{min\_perc\_geno.snp} and \code{min\_maf} are evaluated in this order.
}
\value{The returned value is an object of class haplohh}
\references{
   Scheet P, Stephens M (2006) A fast and flexible statistical model for large-scale population genotype data:
   applications to inferring missing genotypes and haplotypic phase. \emph{Am J Hum Genet}, \bold{78}, 629-644.
   
   O'Connell J, Gurdasani D, Delaneau O, et al (2014) A general approach for haplotype phasing across
   the full spectrum of relatedness. \emph{PLoS Genet}, \bold{10}, e1004234.
}
\seealso{calc_ehh,calc_ehhs,scan_hh,make.example.files}
\examples{
#Copy example files in the current working directory.
make.example.files()
#using the fastPHASE output haplotype example file
hap<-data2haplohh(hap_file="bta12_hapguess_switch.out",map_file="map.inp",
min_maf=0.05,popsel=7,chr.name=12,recode.allele=TRUE)
#using the standard output haplotype example file
hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",
min_maf=0.05,chr.name=12,recode.allele=TRUE)
}
