# Assignment Problem
# with Dummy's ie when no of rows != columns : unbalanced
# add dummy column or row to balance and put 0 as cost
# A 11 14 6
# B 8  10 11
# C 9  12 7 
# D 10 13 8
library(lpSolve)
assign.costs1 = matrix(c(11,14,6,8,10,11,9,12,7,10,13,8 ),nrow=4, byrow=T)
assign.costs1
dummy = c(0,0,0,0)
assign.costs2 = cbind(assign.costs1, dummy)
assign.costs2
colnames(assign.costs2) = c('P1','P2','P3','P4-D')
rownames(assign.costs2) = c('A','B','C','D')

assign.costs2

lp.assign(assign.costs2)
lpa2 = lp.assign(assign.costs2)
lp.assign(assign.costs2)$solution
lpa2$solution
lpa2$direction
lpa2$objval
lpa2$costs
# one of the workers assigned to dummy project



