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
#x1,x2,x3,x4,x5,x6
obj <- c(340000,270000,290000,32,33,30)
mat <- matrix(c(0,0,0,1,1,1
              ,21000,0,0,-1,0,0 
              ,0,20000,0,0,-1,0
              ,0,0,19000,0,0,-1), nrow = 4, byrow=T)
mat
dir <- c(">=", ">=",">=",">=") # 4 constraints
rhs <- c(38000,0,0,0)
max <- TRUE
types <- c("I", "I","I","I","I","I") # 0 or 1

#Setting Lower and Upper Bounds
#Another useful argument in lpsymphony is the bounds argument. 
#The default lower and upper bounds are zero and infinity, respectively.
#To change the default bounds pass a list of upper-bound and lower-bound lists (argument bounds is a list of
bounds <- list(lower = list(ind = c(1,2,3,4,5,6), val = c(0,0,0,0,0,0)),
               upper = list(ind = c(1,2,3,4,5,6), val = c(1,1,1,Inf,Inf,Inf)))
bounds
lpR1=Rsymphony_solve_LP(obj, mat, dir, rhs, max = max, types = types,bounds = bounds)
mat
lpR1$objval  # values of x_1=1, x_2=0, x_3=1 : Correct Binary 
lpR1$solution # Maximum value   - solution found
lpR1$status

# Anwswer not correct

# Trial and Error
x1=0;x2=1;x3=1;x4=0 ;x5=19000 ;x6=19000
sol = 340000*x1 + 270000*x2 + 290000*x3 + 32*x4 + 33*x5 + 30*x6
sol

