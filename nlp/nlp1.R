# Non Linear Programming NLP
# https://cran.r-project.org/web/views/Optimization.html
#NLP (Nonlinear programming, 90C30): nloptr, alabama, Rsolnp, Rdonlp2, rLindo
#https://cran.r-project.org/web/packages/nloptr/index.html
library(nloptr)
?nloptr
#https://www.quora.com/What-are-the-R-packages-for-non-linear-optimization-with-constraint-problems

f = function(x){
  term = x*(2^(x-1))*exp(-2^x)
  return(-term) ### since the function will be minimized by default
}
#Step-2: Choose initial solution.
init = 1
constrOptim(init,f,grad=NULL,ui=1,ci=0)



library(caTools)
?caTools
