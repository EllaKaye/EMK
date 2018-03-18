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

  if (!requireNamespace("DiagrammeR", quietly = TRUE)) {
    stop("Package \"DiagrammeR\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("DiagrammeRsvg", quietly = TRUE)) {
    stop("Package \"DiagrammeRsvg\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("knitr", quietly = TRUE)) {
    stop("Package \"knitr\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  if (!requireNamespace("rsvg", quietly = TRUE)) {
    stop("Package \"rsvg\" needed for this function to work. Please install it.",
         call. = FALSE)
  }


  g <- DiagrammeR::grViz(gv)

  utils::capture.output({
    DiagrammeRsvg::export_svg(g) %>% charToRaw() %>% rsvg::rsvg_png(filename)
  })

  #cat(filename)
  knitr::include_graphics(filename)
}
