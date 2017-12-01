#' A Not In Function
#'
#' This function is the opposite of the %in% function.
#'
#' @param x a character string
#'
#' @keywords notin
#' @export

%notin%' <- function(x, table) match(x, table, nomatch = 0) == 0
