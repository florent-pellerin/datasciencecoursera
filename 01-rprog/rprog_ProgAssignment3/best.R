
## Return hospital name in that state with lowest 30-day death rate
best <- function(state, outcome) {
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
  ## Return hospital name in that state with lowest 30-day death rate
  ### filter on state
  measures <- measures[measures$State == state,]
  ### convert column to numeric
  measures[,idx] <- as.numeric(measures[,idx])
  ### remove NAs
  measures <- measures[!is.na(measures[,idx]),]
  ### get the minimum rate
  theMin <- min(measures[,idx])
  ### filter on that minimum rate
  hospitalNames <- measures[measures[,idx] == theMin,2]
  ### sort by name in case of tie
  sort(hospitalNames)[1]
}