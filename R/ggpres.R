#' Adjust test size on a ggplot to make it visible in presentations
#'
#' Change the size of text on a \code{ggplot} so that a plot designed to look good in print is readable when included in a slide in a presentation (or vice verse)
#' @param g A \code{ggplot} graph
#' @param title_size The font size for the title, legend title and axes titles
#' @param text_size The font size for for the axis lables, legend text and facet text
#' @return A \code{ggplot} graph
#' @author Ella Kaye
#' @examples
#' mt <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, wt, colour = factor(cyl))) +
#'    ggplot2::geom_point() +
#'    ggplot2::facet_grid(. ~ cyl, scales = "free") +
#'    ggplot2::ggtitle("A faceted graph")
#' ggpres(mt)
#' @export
ggpres <- function(g, title_size = 24, text_size = 18) {

  requireNamespace("ggplot2", quietly = TRUE)

  # argument check
  if (!ggplot2::is.ggplot(g)) stop("g must be a ggplot object")

  # define the adjustment
  pres_adj <- ggplot2::theme(axis.text=ggplot2::element_text(size = text_size), axis.title=ggplot2::element_text(size = title_size), strip.text.x = ggplot2::element_text(size = text_size), strip.text.y = ggplot2::element_text(size = text_size), legend.text = ggplot2::element_text(size = text_size), legend.title=ggplot2::element_text(size = title_size), title=ggplot2::element_text(size = title_size))

  # return adjusted graph
  g + pres_adj
}
