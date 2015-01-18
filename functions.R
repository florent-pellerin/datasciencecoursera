add2 <- function(x, y) {
  x + y
}

above <- function(x, n = 10) {
  x[x > n]
}

columnmean <- function(y, removeNA = TRUE) {
  ncol <- ncol(y)
  means <- numeric(ncol)
  for (i in 1:ncol) {
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}