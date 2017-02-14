# LP Problems : Mixed Integer 2: : rSymphony
# Modeling with Binary Variables
#solver for mixed-integer linear programs
library(Rsymphony)

# QAM Book Pg 498 Example
## Simple linear program.
## maximize NPV:25000 x_1 + 18000 x_2 + 32000 x_3 
## subject to:   8000 x_1 +  6000 x_2 + 12000 x_3 <= 20000 
##               7000 x_1 +  4000 x_2 +  8000 x_3 <= 16000
##              
##  x_1, x_2, x_3  are 0 or 1 values

obj <- c(25000, 18000, 32000)
mat <- matrix(c(8000, 6000, 12000, 
                7000, 4000, 8000), nrow = 2, byrow=T)
mat
dir <- c("<=", "<=")
rhs <- c(20000,16000)
max <- TRUE
types <- c("I", "I") # 0 or 1

#Setting Lower and Upper Bounds
#Another useful argument in lpsymphony is the bounds argument. 
#The default lower and upper bounds are zero and infinity, respectively.
#To change the default bounds pass a list of upper-bound and lower-bound lists (argument bounds is a list of
#bounds <- list(lower = list(ind = c(1,2,3), val = c(1,1,1)),
#               upper = list(ind = c(1,2,3), val = c(5,5,5)))
bounds <- list(lower = list(ind = c(1,2,3), val = c(0,0,0)),
               upper = list(ind = c(1,2,3), val = c(1,1,1)))
bounds
lpR1=Rsymphony_solve_LP(obj, mat, dir, rhs, max = max, types = types,bounds = bounds)
mat
lpR1$objval  # values of x_1=1, x_2=0, x_3=1 : Correct Binary 
lpR1$solution # Maximum value   - solution found
lpR1$status

# Trial and Error
x1=1;x2=0;x3=1
sol = 25000 * x1 + 18000 * x2 + 32000 * x3
sol

