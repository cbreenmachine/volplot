#' A wrapper around clusterProfiler::enrichGO
#'
#' This function
#' @param genes a vector of ENSEMBL (the ones that start ENS000000...) strings
#' @export
#'
run_gene_ontology <- function(genes){
  clusterProfiler::enrichGO(
    genes,
    OrgDb = "org.Hs.eg.db",
    keyType = "ENSEMBL",
    ont = "ALL",
    pAdjustMethod = "fdr"
  )
}
