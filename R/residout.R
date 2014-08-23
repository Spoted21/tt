#' A Residuals Function
#'
#' This function allows you to output a residuals table in latex format.
#'
#' @param X a design matrix y response vector
#' @param y response vector
#'
#' @keywords residuals
#' @export
#' @examples
#' residout()

residout <- function(x,y)
{
##########################################################
#Written by Todd Connelly
# Make sure to define your design matrix "x" and your
# response vector "y" as matricies before running resid.
# the function will output a LaTeX table in your current
# working directory with the name "residuals.tex"
##########################################################

require(xtable)

# Find betahat estimates
b=solve((t(x)%*%x))%*%t(x)%*%y

#Predicted Values y-hat
yhat=x%*%b

#Residuals
e=y-yhat

# Degrees of Freedom for Sums of Squares Error
dfsse=length(y)-(ncol(x)-1) -1

#Sums of Squares Error
SSE = t(e)%*%e

#Mean Square Error
MSE=SSE/dfsse

#Diagonial entries from the hat matrix
h=as.matrix(diag(x%*%solve(t(x)%*%x)%*%t(x)))

#Convert mse to just a number and not a 1x1 matrix
mse=as.numeric(MSE)

# Standardized Residuals d
d=e/(sqrt(mse))

#Studentized Residuals r
r=e/(sqrt(mse*(1-h)))

#Press REsiduals
pr=as.matrix(e/(1-h))

#Squared PRESS residuals
res2=(pr)^2

#Combine the different residuals
wow=cbind(y,yhat,e,d,r,pr,res2)

#Make a data frame so you can name the columns
wow2=as.data.frame(wow)

#Give Dataframe names
names(wow2)=c("Y","Predicted","Residual","Standardized Residual","Studentized Residual","PRESS Residuals","Squared Press")

#Turn back into a matrix
wow3=as.matrix(wow2)

#Make an xtable
foo=xtable(wow3,digits=2);

# Use repition command to generate the needed number of entries for the latex table
rstr=rep("r",ncol(wow2)-1)

sink("residuals.tex",append=T)
cat("\\begin{center}")
cat("\\begin{table}[h!]")
cat("\\small")
cat("\\begin{tabular}{|")
cat("c")
cat(rstr)
cat("|}")
cat("\\hline")
cat("\\multicolumn{")
cat(ncol(wow3))
cat("}{|c|}{")
cat("\\textbf{Residuals")
cat("}")
cat("}")
cat(" \\\\ ")
cat("Y & Predicted & Residual & Standardized Residual & Studentized Residual&PRESS Residuals& Squared Press")
cat(" \\\\ ")
cat("& $\\hat{y} = X \\hat{\\beta}$ &$e_i=y_i-\\hat{y_i}$ & $d_i=\\frac{e_i}{\\sqrt{MS_{res}} }$&$r_i=\\frac{e_i}{\\sqrt{MS_{res}(1-H_{ii})} }$
& $e_{(i)} = \\frac{e_i}{1-H_{ii}}  $&$(\\frac{e_i}{1-H_{ii}})^2  $")
cat("\\\\")
print(foo,include.rownames=F,include.colnames=F,only.contents=T,digits=2);
cat("\\multicolumn{")
cat(ncol(wow3))
cat("}{|r|}{")
cat("\\textbf{PRESS Statistic =")
cat(sum(wow[,7]))
cat("}")
cat("}")
cat("\\\\")
cat("\\hline")
cat("\\end{tabular}")
cat("\\end{table}")
cat("\\end{center}")
sink()
}