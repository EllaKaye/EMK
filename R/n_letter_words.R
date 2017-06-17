#' Create n-letter words
#'
#' Create all words of length n from given number of letters
#'
#' @param n the length of the words
#' @param case choose between upper or lower case letters
#' @param num_letters how many letters to use in the word (an integer between 1 and 26)
#' @param as_vector logical
#' @return If as_vector = FALSE, a one column tibble with colname "word" containing all words of length n made with a combination of num_letter letters. If as_vector = TRUE, a vector of all such words.
#' @examples n_letter_words(3)
#' @examples n_letter_words(4, num_letters = 2, case = "lower", as_vector = TRUE)
#' @author Ella Kaye
#' @export
n_letter_words <- function(n, num_letters = 26, case = c("upper", "lower"), as_vector = FALSE) {

  case <- match.arg(case)

  # check n and num_letters
  if (!is.numeric(n)) stop("n must be an integer")
  if (length(n) != 1) stop("n must be an integer")
  if (!is.numeric(num_letters)) stop("num_letters must be an integer between 1 and 26 (inclusive).")
  if (length(num_letters) != 1) stop("num_letters must be an integer between 1 and 26 (inclusive).")
  if (num_letters < 1) stop("num_letters must be an integer between 1 and 26 (inclusive).")
  if (num_letters > 26) stop("num_letters must be an integer between 1 and 26 (inclusive).")

  if (case == "upper") let <- LETTERS
  else let <- letters

  let <- let[1:num_letters]

  out <- dplyr::as_data_frame(expand.grid(rep(list(let), n)))
  out <- tidyr::unite(out, word, 1:n, sep = "")

  if (as_vector) out <- out[[1]]

  out
}

