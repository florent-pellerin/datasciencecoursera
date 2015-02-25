rankall <- function(outcome, num = "best") {
  ## Read outcome data
  measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  measures$State <- factor(measures$State)
  states = levels(measures$State)
  ## Check that outcome is valid
  if (outcome == 'heart attack') {
    idx <- 11
  } else if (outcome == 'heart failure') {
    idx <- 17
  } else if (outcome == 'pneumonia') {
    idx <- 23
  } else {
    stop("invalid outcome")
  }
  ## Return a data frame with the hospital names and the (abbreviated) state name
  ### convert column to numeric
  measures[,idx] <- as.numeric(measures[,idx])
  ### remove NAs
  measures <- measures[!is.na(measures[,idx]),]
  ### order by state, outcome, name
  measures <- measures[with(measures, order(measures$State, measures[,idx], measures$Hospital.Name)), ]        
  
  ### split by state
  byState <- split(measures, measures$State)
  
  ### Find the hospital from each state with the given rank        
  hospitals_by_rank <- sapply(byState, function(x){
    x$rank <- rank(x[,1], ties.method = "first")
    max <- max(x$rank)
    if(num == "best"){
      num <- 1
    } else if(num == "worst"){
      num <- max
    }
    x$Hospital.Name[num]
  })
  
  df <- data.frame(hospital = hospitals_by_rank)
  df$state <- row.names(df)
  
  df
  
}
