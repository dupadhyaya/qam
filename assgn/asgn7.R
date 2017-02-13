# Assignment : Minimise
# City Offices : Hirees : New City Added : NY
# Find Assignment of Hirees to City to min cost
library(lpSolve)
assgn.cost7 = matrix(c(800,1100,1200,1000
  ,500,1600,1300,800
  ,500,1000,2300,1500
  ,0,0,0,0), nrow=4, byrow=T)
assgn.cost7
lpa7 = lp.assign(assgn.cost7)
lpa7$solution
# right Solution
