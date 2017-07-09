#' Adjust test size on a ggplot to make it visible in presentations
#'
#' Change the size of text on a \code{ggplot} so that a plot designed to look good in print is readable when included in a slide in a presentation (or vice verse)
#' @param g A \code{ggplot} graph
#' @param title_size The font size for the title, legend title and axes titles
#' @param text_size The font size for for the axis lables, legend text and facet text
#' @return A \code{ggplot} graph
#' @author Ella Kaye
#' @examples
#'
#' library(ggplot2)
#' g <- ggplot(mpg, aes(displ, hwy)) +
#'  geom_point() +
#'  facet_wrap(~class, scales = "free") +
#'  ggtitle("A faceted plot")
#' g2 <- ggpres(g)
#' g2 + geom_point(size = 2)
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
