# Assignment Problem : Maximisation
library(lpSolve)
# Ship	A	B	C	D
# 1	20	60	50	55
# 2	60	30	80	75
# 3	80	100	90	80
# 4	65	80	75	70

assign.costs1 = matrix(c(20,60,50,55
          ,60,30,80,75,80,100,90,80
          ,65,80,75,70),nrow=4, byrow=T)
assign.costs1
colnames(assign.costs1) = c('A','B','C','D')
rownames(assign.costs1) = c('S1','S2','S3','S4')
assign.costs1
# Set the directions
lp.assign (cost.mat, direction = "min"
           , presolve = 0, compute.sens = 0)
lp.assign(assign.costs1,direction = 'max')
lpa1 = lp.assign(assign.costs1)
lp.assign(assign.costs1)$solution
lpa1$solution
lpa1$direction
lpa1$objval
lpa1$costs

lpa2 = lp.assign(assign.costs1,direction = 'max',compute.sens=1)
lpa2$compute.sens
lpa2$sens.coef.from
lpa2$sens.coef.to
lpa2$duals
