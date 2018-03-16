#' Include digraphs in pdf output of Rmarkdown
#' @param filename String of filename to save to, with exention .png
#' @param gv String of a .gv filename. This file must be stored in the same working directory
#' @return Plots a digraph in the pdf output of an Rmarkdown document, when function is embedded in a code chunk.
#' @examples
#' \dontrun{
#' pdf_digraph_gv("graph.png", "graph.gv")
#' }
#' @export

pdf_digraph_gv <- function(filename, gv){
  g <- DiagrammeR::grViz(gv)

  capture.output({
    DiagrammeRsvg::export_svg(g) %>% charToRaw() %>% rsvg::rsvg_png(filename)
  })

  #cat(filename)
  knitr::include_graphics(filename)
}
