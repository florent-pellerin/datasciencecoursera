# Coursera Course Project Getting and Cleaning Data

## Course Project Requirements
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Solution proposed
The solution proposed is the script 'run_analysis.R', which performs the required transformations.

## Usage
The script 'run_analysis.R' and the original Samsung data set folder 'UCI HAR Dataset' should be aside each other, and present in the current working directory of the R session.
Source and run the script, which will read data from 'UCI HAR Dataset', and produce a new file 'tidySet.txt' containing the expected result tidy data set.

## Documentation
The original Samsung data set documentation is available from Coursera Course Project Getting and Cleaning Data in getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The CodeBook of the tidy data set produced by 'run_analysis.R' is present aside this README.md in CodeBook.md
