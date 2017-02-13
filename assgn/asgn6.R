# Assignment Problem : Maximisation
library(lpSolve)
#Teacher - Course / Subject		
#     S1	S2	S3	S4
# T1	67	75	56	70
# T2	55	57	66	56
# T3	72	74	78	81
# T4	82	75	72	77
# Assign Teacher who helps student get max marks

assign.costs2 = matrix(c(0,75,0,70
             ,85,57,0,0,72,0,78,81
             ,82,0,72,77),nrow=4, byrow=T)
rownames(assign.costs2) = c('T1','T2','T3','T4')
colnames(assign.costs2) = c('S1','S2','S3','S4')
assign.costs2
lpa2 = lp.assign(assign.costs2,direction = 'max',compute.sens=1)
lpa2$solution
lpa2$objval
lpa2$compute.sens
lpa2$sens.coef.from
lpa2$sens.coef.to
lpa2$duals
#------------
a4 =t(assign.costs2)
a4
lpa4 = lp.assign(a4,direction = 'max',compute.sens=1)
lpa4$solution
lpa4$objval






#----
assign.costs3 = matrix(c(47,45,46,70
                         ,45,77,0,56,42,44,58,81
                         ,82,55,0,0),nrow=4, byrow=T)
assign.costs3
rownames(assign.costs3) = c('T1','T2','T3','T4')
colnames(assign.costs3) = c('S1','S2','S3','S4')
assign.costs3
# Set the directions
lp.assign(assign.costs3,direction = 'max')
lpa1 = lp.assign(assign.costs3)
# Answer check ?
lp.assign(assign.costs3)$solution
lpa3$solution
lpa3$direction
Avg = lpa3$objval/4
Avg
lpa3$costs