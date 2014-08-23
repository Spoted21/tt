#' A Trim Function
#'
#' This function trims the whitespace on both sides of a string.
#'
#' @param x a character string
#'
#' @keywords trim
#' @export
#' @examples
#' trim("  Hello World ")


trim <- function (x) gsub("^\\s+|\\s+$", "", x)
