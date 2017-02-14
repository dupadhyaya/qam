# Combination of Values
x <- seq(0, 10, length.out = 100)
x
y <- seq(-1, 1, length.out = 20)
y
d1 <- expand.grid(x = x, y = y)
d1[1:10,]
d2 <- expand.grid(x = x, y = y, KEEP.OUT.ATTRS = FALSE)
d2[1:10,]

object.size(d1) - object.size(d2)

# ----------------
x <- seq(1, 6, length.out = 6)
x
y <- seq(1, 5, length.out = 5)
y
d1 <- expand.grid(x = x, y = y)
d1[1:10,]
d1
d2 <- expand.grid(x = x, y = y, KEEP.OUT.ATTRS = FALSE)
d2[1:10,]


# Choose --------------
choose(5, 2)
for (n in 0:10) print(choose(n, k = 0:n))

# Combinat
library(combinat)
combn(letters[1:4], 2)
combn(10, 5, min) # minimum value in each combination
combn(x, m, fun=NULL, simplify=TRUE, ...)
# Different way of encoding points:
combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins = 4)
#Compute support points and (scaled) probabilities for a
#Multivariate-Hypergeometric(n = 3, N = c(4,3,2,1)) p.f.:
#table.mat(t(combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate,nbins=4)))

combn(10, 6,mean)
