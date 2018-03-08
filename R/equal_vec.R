#' Test if all elements of a numeric vector are equal
#' @param x a numeric vector
#' @param tol the tolerance
#' @return logical
#' @seealso [same_elements]
#' @md
#' @export
zero_range <- function(x, tol = .Machine$double.eps ^ 0.5) {
  if (!is.numeric(x)) stop("x must be numeric. Use same_elements instead.")
  if (length(x) == 1) return(TRUE)
  x <- range(x) / mean(x)
  isTRUE(all.equal(x[1], x[2], tolerance = tol))
}

#' Test if all elements of a vector are equal
#' @param x a vector
#' @return logical
#' @seealso [zero_range]
#' @md
#' @export
same_elements <- function(x) {
  all(x[1] == x)
}
