# Assignment Problem
library(lpSolve)
assign.costs1 = matrix(c(11,14,6,8,10,11,9,12,7),nrow=3, byrow=T)
assign.costs1
lp.assign(assign.costs1)
lpa1 = lp.assign(assign.costs1)
lp.assign(assign.costs1)$solution
lpa1$solution
lpa1$direction
lpa1$objval
lpa1$costs



