library(EMK)
context("n_letter_words")

test_that("output type", {
  expect_is(n_letter_words(2, 4), "tbl_df")
  expect_is(n_letter_words(2, 4, as_vector = TRUE), "character")
})

test_that("inputs", {
  expect_error(n_letter_words("a"), "n must be an integer")
})
