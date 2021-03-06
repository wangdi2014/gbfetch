% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch_metadata.R
\name{fetch_metadata_from_id}
\alias{fetch_metadata_from_id}
\title{Fetch metadata for a GenBank sequence}
\usage{
fetch_metadata_from_id(id, col_select = c("gi", "caption", "taxid",
  "title", "slen", "subtype", "subname"), higher_taxa = FALSE,
  .pb = NULL)
}
\arguments{
\item{id}{Character vector of IDs for GenBank records.
Output of rentrez::entrez_search().}

\item{col_select}{Character vector of metadata columns to include
in results. Must include at least `taxid` so that species
can be included. Default values include:
\itemize{
  \item{gi}{Genbank GI number}
  \item{caption}{Genbank accession number}
  \item{taxid}{Taxon ID (can use to query with taxize)}
  \item{title}{Sequence title}
  \item{slen}{Sequence length}
  \item{subname}{Misc. data (specimen, collection country, etc), separated
  by |}
  \item{subtype}{Column names of misc. data, separated by |}
}}

\item{higher_taxa}{Logical; should higher taxonomic ranks (family and order)
be included in the results?}

\item{.pb}{Internal agument used for setting the progress bar; don't change this.}
}
\value{
Tibble
}
\description{
Metadata is obtained in two steps, first with rentrez::entrez_summary(),
then with taxize::classification() to get the species name.
}
\details{
To see other possible values to use for `col_select`, run
rentrez::entrez_summary() with `db = nucleotide` for a valid ID,
e.g. rentrez::entrez_summary(db = "nucleotide", id = "383212727")
}
\examples{
\dontrun{
fetch_metadata_from_id("383212727", higher_taxa = TRUE)
fetch_metadata_from_id(c("383212727", "383212725"))
}
}
