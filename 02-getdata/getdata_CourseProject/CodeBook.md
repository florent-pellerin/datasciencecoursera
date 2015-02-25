# CodeBook
Description: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

## Variables
All variables are computed from the Samsung data set.

### Original Samsung data set variables
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

### Tidy data set variables
The tidy data set is composed of 81 Variables:
 [1] "Subject"                              "Activity"                             "tBodyAcc-mean()-X_mean"              
 [4] "tBodyAcc-mean()-Y_mean"               "tBodyAcc-mean()-Z_mean"               "tBodyAcc-std()-X_mean"               
 [7] "tBodyAcc-std()-Y_mean"                "tBodyAcc-std()-Z_mean"                "tGravityAcc-mean()-X_mean"           
[10] "tGravityAcc-mean()-Y_mean"            "tGravityAcc-mean()-Z_mean"            "tGravityAcc-std()-X_mean"            
[13] "tGravityAcc-std()-Y_mean"             "tGravityAcc-std()-Z_mean"             "tBodyAccJerk-mean()-X_mean"          
[16] "tBodyAccJerk-mean()-Y_mean"           "tBodyAccJerk-mean()-Z_mean"           "tBodyAccJerk-std()-X_mean"           
[19] "tBodyAccJerk-std()-Y_mean"            "tBodyAccJerk-std()-Z_mean"            "tBodyGyro-mean()-X_mean"             
[22] "tBodyGyro-mean()-Y_mean"              "tBodyGyro-mean()-Z_mean"              "tBodyGyro-std()-X_mean"              
[25] "tBodyGyro-std()-Y_mean"               "tBodyGyro-std()-Z_mean"               "tBodyGyroJerk-mean()-X_mean"         
[28] "tBodyGyroJerk-mean()-Y_mean"          "tBodyGyroJerk-mean()-Z_mean"          "tBodyGyroJerk-std()-X_mean"          
[31] "tBodyGyroJerk-std()-Y_mean"           "tBodyGyroJerk-std()-Z_mean"           "tBodyAccMag-mean()_mean"             
[34] "tBodyAccMag-std()_mean"               "tGravityAccMag-mean()_mean"           "tGravityAccMag-std()_mean"           
[37] "tBodyAccJerkMag-mean()_mean"          "tBodyAccJerkMag-std()_mean"           "tBodyGyroMag-mean()_mean"            
[40] "tBodyGyroMag-std()_mean"              "tBodyGyroJerkMag-mean()_mean"         "tBodyGyroJerkMag-std()_mean"         
[43] "fBodyAcc-mean()-X_mean"               "fBodyAcc-mean()-Y_mean"               "fBodyAcc-mean()-Z_mean"              
[46] "fBodyAcc-std()-X_mean"                "fBodyAcc-std()-Y_mean"                "fBodyAcc-std()-Z_mean"               
[49] "fBodyAcc-meanFreq()-X_mean"           "fBodyAcc-meanFreq()-Y_mean"           "fBodyAcc-meanFreq()-Z_mean"          
[52] "fBodyAccJerk-mean()-X_mean"           "fBodyAccJerk-mean()-Y_mean"           "fBodyAccJerk-mean()-Z_mean"          
[55] "fBodyAccJerk-std()-X_mean"            "fBodyAccJerk-std()-Y_mean"            "fBodyAccJerk-std()-Z_mean"           
[58] "fBodyAccJerk-meanFreq()-X_mean"       "fBodyAccJerk-meanFreq()-Y_mean"       "fBodyAccJerk-meanFreq()-Z_mean"      
[61] "fBodyGyro-mean()-X_mean"              "fBodyGyro-mean()-Y_mean"              "fBodyGyro-mean()-Z_mean"             
[64] "fBodyGyro-std()-X_mean"               "fBodyGyro-std()-Y_mean"               "fBodyGyro-std()-Z_mean"              
[67] "fBodyGyro-meanFreq()-X_mean"          "fBodyGyro-meanFreq()-Y_mean"          "fBodyGyro-meanFreq()-Z_mean"         
[70] "fBodyAccMag-mean()_mean"              "fBodyAccMag-std()_mean"               "fBodyAccMag-meanFreq()_mean"         
[73] "fBodyBodyAccJerkMag-mean()_mean"      "fBodyBodyAccJerkMag-std()_mean"       "fBodyBodyAccJerkMag-meanFreq()_mean" 
[76] "fBodyBodyGyroMag-mean()_mean"         "fBodyBodyGyroMag-std()_mean"          "fBodyBodyGyroMag-meanFreq()_mean"    
[79] "fBodyBodyGyroJerkMag-mean()_mean"     "fBodyBodyGyroJerkMag-std()_mean"      "fBodyBodyGyroJerkMag-meanFreq()_mean"

The first variable, "Subject" identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
The second variable, "Activity" identifies the activity used in each experiment. There are 6 levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING.
The 79 other variables are the "mean" and "standard deviation" features from the original Samsung data set, summarized with the function "mean" for each subject for each activity. The features are described in the original 'features_info.txt'.

## Data
The tidy data set is composed of 180 observations of the 81 variables described here above.
The original 10299 observations were summarized with the function "mean" for each subject for each activity.
As we have 30 subjects and 6 activities, our data set contains 30 * 6 aggregated observations.

## Transformations
The tidy data set is computed for the original Samsung data set.
The transformations are performed by 'run_analysis.R':
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
