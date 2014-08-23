#' A Package Loading Function
#'
#' This function uses `library' to load the package if installed and installs and then loads the package otherwise.
#'
#' @param x a character string that is a valid R package.
#'
#' @keywords package
#' @export
#' @examples
#' loadpkg("knitr")

loadpkg <- function(x){
	if(!is.element(x, installed.packages()))
		{install.packages(x)
		library(x,character.only=T)
	}else{library(x,character.only=T)}
}

