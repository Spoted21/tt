#' @description Todd's Tools (tt)
#'
#' This package is simply a collection of functions that I have found useful.
#' More information about each function can be found in its help documentation.
#'
#' \code{\link{matout}}
#'
#' Output a matrix in Latex format. This works well in combination with the knitr package.
#'
#'\code{\link{loadpkg}}
#'
#' loadpkg is a simply function to avoid having to type library(somepackage) and realize that
#' you don't have it installed. It will use the library command to load the package if installed
#' otherwise it will download it and then use library to load the package.
#'
#' Contact Information
#'
#' Please email Todd at todd.connelly "at" theprism.co with questions or comments.
#' 
#' 
#' @import xtable 
#' @docType package
#' @name tt
NULL