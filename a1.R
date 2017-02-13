lps.model <- make.lp(4, 0)
x <- c(6,2,4,9)
lps.model
add.column(lps.model, x)
y <- c(3,1,5)
ind <- c(1,2,4)
add.column(lps.model, y, ind)
dimnames(lps.model) <- list(c("alpha", "bravo", "charlie", "delta"),
                            c("whiskey", "tango"))
lps.model
delete.lp(lps.model)
