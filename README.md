Miscellaneous functions I find useful

[![Travis-CI Build Status](https://travis-ci.org/EllaKaye/EMK.svg?branch=master)](https://travis-ci.org/EllaKaye/EMK)

`n_letter_words` is a function that will produce all 'words' of `n` letters long. So, for example, `n_letter_words(3)` gives a tibble with 26^3 rows (starting with AAA and ending with ZZZ). `n_letter_words(3, as_vector = TRUE)` gives a vector of those words. The number of letters to use can also be set, so `n_letter_words(4, num_letters = 2)` gives all 16 four letter words containing A and B. There's also a `case` argument, which defaults to `upper` but can be set as `lower`. 

