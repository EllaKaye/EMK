.onLoad <- function(libname = find.package("EMK"), pkgname = "EMK"){

  # CRAN Note avoidance
  if(getRversion() >= "2.15.1")
    utils::globalVariables(
      c("word", "%>%")
    )
  invisible()
}

#.onUnload <- function (libpath) {
#  library.dynam.unload("EMK", libpath)
#}
