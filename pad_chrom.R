#' A munging function to turn Gene Ontology outputs into data frame
#'
#' @param go.out the output from running enrichGO() or run_gene_ontology()
#' @export
#' @examples
#' go_output_to_df()



go_output_to_df <- function(go.out){

  # Constant to define mapping from abbreviated terms to full ones used in plots
  MAPPING <- data.frame(
    ONTOLOGY = c("MF", "CC", "BP"),
    Ontology = c("Molecular\nfunction", "Cellular\ncomponent", "Biological\nprocess")
  )

  go.df <- data.frame(go.out)

  # Get the names right
  dplyr::left_join(go.df, MAPPING, by = "ONTOLOGY")
}
