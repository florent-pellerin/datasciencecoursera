corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  source('complete.R')
  nobs <- complete(directory)
  ids <- nobs[nobs['nobs'] > threshold,][,'id']
  
  if (length(ids) < 1) {
    vector(mode="numeric", length=0)
  } else {
  
    files <- paste(directory, '/', sprintf('%03d',ids), '.csv', sep='')
    datas <- lapply(files,read.csv)
    
    cordata <- function(data) {
      cor(data[,2], data[,3], use = "complete.obs")
    }
    
    sapply(datas, cordata)
  }
}