# LP Problems : rSymphony
# An R interface to the SYMPHONY
#solver for mixed-integer linear programs
library(Rsymphony)
Rsymphony_solve_LP(obj, mat, dir, rhs, bounds = NULL, types = NULL,
        max = FALSE, verbosity = -2, time_limit = -1,
        node_limit = -1, gap_limit = -1, first_feasible = FALSE,
        write_lp = FALSE, write_mps = FALSE)
#a character vector giving the types of the objective variables, with "C", "I",
#and "B" corresponding to continuous, integer, and binary, respectively, or NULL
?Rsymphony_solve_LP


# Help Example
## Simple linear program.
## maximize:   2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
##             2 x_1 +   x_2 +   x_3 <= 40
##               x_1 + 3 x_2 + 2 x_3 <= 80
##               x_1, x_2, x_3 are non-negative real numbers

# Default - Continuous
obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 1, 2), nrow = 3, byrow=F)
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE
lpR1=Rsymphony_solve_LP(obj, mat, dir, rhs, max = max)
lpR1$objval  # values of x_1=0, x_2=0, x_3=30
lpR1$solution # Maximum value 90  - solution found


# Mixed Integer ---------------

## Simple mixed integer linear program.
## maximize:    3 x_1 + 1 x_2 + 3 x_3
## subject to: -1 x_1 + 2 x_2 +   x_3 <= 4
##                      4 x_2 - 3 x_3 <= 2
##                x_1 - 3 x_2 + 2 x_3 <= 3
##                x_1, x_3 are non-negative integers
##                x_2 is a non-negative real number

obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3, byrow=F)
mat
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
max <- TRUE
types <- c("I", "C", "I")
# x_1- integer; x_2-Continuous, x_3 - Integer

lpR2 = Rsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max)
lpR2$solution  # # x_1- 5; x_2-2.75, x_3-3
lpR2$objval  # max value achieved under the constraints 26.75


# Above Problem with Bounds
## Same as before but with bounds replaced by
## -Inf <  x_1 <= 4
##    0 <= x_2 <= 100
##    2 <= x_3 <  Inf

bounds <- list(lower = list(ind = c(1L, 3L), val = c(-Inf, 2)),
               upper = list(ind = c(1L, 2L), val = c(4, 100)))

lpR3 = Rsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max,
                   bounds = bounds)
lpR3$solution # 4.0 2.5 3.0
lpR3$objval # 23.5
