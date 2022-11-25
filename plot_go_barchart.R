#' Plot gene ontology outputs
#'@param go.df a data frame with at least Ontology, Description, and p.adjust
#'
#'@details
#'Cleaner looking version
#'@import ggplot2
#' @export


plot_go_barchart <- function(go.df, n=30){

  subdata <- head(arrange(go.df, -p.adjust), n)
  subdata$Description <- factor(subdata$Description, levels = subdata$Description)

  ggplot(data = subdata,
         aes(x = Description,
             y = -log10(p.adjust),
             fill = Ontology)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    theme_minimal(base_size = 20) +
    xlab("") +
    ylab(expression(-log[10](p.adjusted))) +
    labs(legend = "") +
    theme(legend.position = "top",
          plot.background = element_rect(fill = "white", color = "white")) +
    scale_fill_manual(values = c("red", "orange", "blue"))
}
