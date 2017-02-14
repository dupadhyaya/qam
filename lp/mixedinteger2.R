# LP Problems : Mixed Integer 2: rSymphony
# An R interface to the SYMPHONY
#solver for mixed-integer linear programs
library(Rsymphony)
Rsymphony_solve_LP(obj, mat, dir, rhs, bounds = NULL, types = NULL,
        max = FALSE, verbosity = -2, time_limit = -1,
        node_limit = -1, gap_limit = -1, first_feasible = FALSE,
        write_lp = FALSE, write_mps = FALSE)

# QAM Book Pg 486 Example
## Simple linear program.
## maximize:   7 x_1 + 6 x_2 
## subject to: 2 x_1 + 3 x_2 <= 12 (wiring hours)
##             6 x_1 + 5 x_2 <= 30 (assembly hours)
##               x_1, x_2  are non-negative real numbers

obj <- c(7, 6)
mat <- matrix(c(2,3,6,5), nrow = 2, byrow=F)
mat
dir <- c("<=", "<=")
rhs <- c(12,30)
max <- TRUE
typesC <- c("C", "C")
typesI <- c("I", "I")

lpR1=Rsymphony_solve_LP(obj, mat, dir, rhs, max = max, types = typesC)
lpR1=Rsymphony_solve_LP(obj, mat, dir, rhs, max = max, types = typesI)

lpR1$objval  # values of x_1=0, x_2=0, x_3=30
lpR1$solution # Maximum value   - solution found

# Trial and Error
x1=6;x2=0
sol = 7*x1 + 6*x2
sol

# Trial - all combination of x1 and x2 
combn(1:6, 2)
expand.grid(x1 = seq(1, 6, 1), x2 = seq(1, 6, 1))
