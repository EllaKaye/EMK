#' Include digraphs in pdf output of Rmarkdown
#' @param filename String of filename to save to, with exention .pdf
#' @param code Either a string defining a digraph in the DOT language, or a string of a .gv filename (this file must be stored in the same working directory).
#' @return Plots a digraph in the pdf output of an Rmarkdown document, when function is embedded in a code chunk.
#' @examples
#' \dontrun{
#' pdf_digraph_gv("graph.pdf", "graph.gv")
#' }
#' @export

pdf_digraph <- function(filename, code){

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


  g <- DiagrammeR::grViz(code)

  utils::capture.output({
    DiagrammeRsvg::export_svg(g) %>% charToRaw() %>% rsvg::rsvg_pdf(filename)
  })

  knitr::include_graphics(filename)
}


