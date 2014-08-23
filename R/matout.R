#' A Matrix Output Function
#'
#' This function allows you to output a matrix from R in Latex format. It is nothing more than 
#' a wrapper for 'xtable'.
#'
#' @param X a matrix
#' @param name a name for your matrix, defaults to X
#' @param justify should your matrix be left, right or centered? 
#' Takes the first letter as an argument and defaults to centered.
#' @param dig the number of digits to display. This is passed directly to xtable as a parameter.
#'
#' @keywords matrix
#' @export
#' @examples
#' set.seed(100)
#' matout( matrix(floor(runif(9,1,9)),ncol=3) )
#'
#' matout( matrix(runif(9,1,9),ncol=3),dig=3)
#'
#' ## Greek letters can also be passed, just make sure to use the '$' to tell 
#' ## Latex that you want to be in math mode.
#' matout( matrix(runif(9,1,9),ncol=3),dig=3,name="$\\Psi$")



matout <- function(X,name="X",justify="c",dig=0)
############################################################
# Function written by Todd Connelly, 2010                  #
# Feel free to distribute and edit as needed               #
# If you have found this function useful or have comments, #
# please email me at spoted21@yahoo.com                    #
############################################################
{
require(xtable)
cstr=rep("c",ncol(X))
rstr=rep("r",ncol(X))
lstr=rep("l",ncol(X))
foo=xtable(X,digits=dig);
cat("\\textbf{")
cat(name)
cat("}")
cat("=$\\left[ \\begin{array}{")
if (justify=="c")
cat(cstr)
else if (justify=="l")
cat(lstr)
else
cat(rstr)
cat("}")
print(foo,include.rownames=F,include.colnames=F,only.contents=T,hline.after=NULL,digits=dig);
cat("\\end{array} \\right]$");
}