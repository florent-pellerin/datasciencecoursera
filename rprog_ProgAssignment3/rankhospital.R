rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  measures <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  measures$State <- factor(measures$State)
  ## Check that state and outcome are valid
  if (!state %in% measures$State) {
    stop("invalid state")
  }
  if (outcome == 'heart attack') {
    idx <- 11
  } else if (outcome == 'heart failure') {
    idx <- 17
  } else if (outcome == 'pneumonia') {
    idx <- 23
  } else {
    stop("invalid outcome")
  }
  ## Return hospital name in that state with the given rank 30-day death rate
  ### filter on state
  measures <- measures[measures$State == state,]
  ### convert column to numeric
  measures[,idx] <- as.numeric(measures[,idx])
  ### remove NAs
  measures <- measures[!is.na(measures[,idx]),]
  ### sort by outcome
  measures <- measures[order(measures[,idx], measures[,2]),]
  hospitalNames <- measures[,2]
  if (num == "best") {
    hospitalNames[1]
  } else if (num == "worst") {
    tail(hospitalNames, n=1)
  } else {
    hospitalNames[num]
  }
}