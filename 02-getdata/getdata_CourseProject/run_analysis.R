
# This run_analysis scripts is performing getdata-011 course project computations

# Prerequisites: Samsung data is in your working directory.
# Folder name in which the data set is in the following variable dataDir. Default is 'UCI HAR Dataset'
dataDir <- 'UCI HAR Dataset'

# Name of the result tidy data set, the output of this script
tidySetFile <- "tidySet.txt"

# Number of features in the vector
nFeatures <- 561

# Wrapper function to efficiently read a table compose of nCol columns of numeric data.
readNumericTable <- function(file, nCol) {
  read.table(file, header=FALSE, quote="", colClasses=rep("numeric", nCol), comment.char="")
}

# Function to build the train or test data set. Call buildSet('train') or buildSet('test').
buildSet <- function(set) {
  subjectCol <- readNumericTable(file.path(dataDir, set, paste('subject_', set, '.txt', sep='')), 1)
  activityCol <- readNumericTable(file.path(dataDir, set, paste('y_', set, '.txt', sep='')), 1)
  featuresSet <- readNumericTable(file.path(dataDir, set, paste('X_', set, '.txt', sep='')), nFeatures)
  # Column-based merge of the three subsets
  cbind(subjectCol, activityCol, featuresSet)
}

# Step 1: Loading and merging the 'train' and 'test' sets
mergedSet <- rbind(buildSet('test'), buildSet('train'))

# Step 2: Adding Subject and Activity as factors
mergedSet[,1] <- as.factor(mergedSet[,1])
activityNames <- read.table(file.path(dataDir, 'activity_labels.txt'), colClasses = rep('character', 2))
mergedSet[,2] <- factor(mergedSet[,2], levels=activityNames[,1], labels=activityNames[,2])

# Step 3: Setting meaningful column names
featuresNames <- read.table(file.path(dataDir, 'features.txt'), colClasses = rep('character', 2))
colnames(mergedSet) <- c('Subject', 'Activity', featuresNames[,2])

# Step 4: Extracting only the measurements on the mean and standard deviation for each measurement.
meanAndStdSet <- mergedSet[,c(1, 2, grep("mean|std", names(mergedSet)))]

# Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidySet <- aggregate(. ~ Subject + Activity, meanAndStdSet, mean)
colnames(tidySet) <- c(names(tidySet)[1:2], paste(tail(names(tidySet), -2), '_mean', sep=''))

# Step 6: Saving the tidy dataset as a file
write.table(tidySet, file=tidySetFile, row.name=FALSE)
