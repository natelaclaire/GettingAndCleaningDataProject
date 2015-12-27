run_analysis <- function() {
    library(dplyr)
    
    ## Step 1. Merges the training and the test sets to create one data set.
    # load column names from features.txt - they are in the 2nd column - and
    # convert them to R-friendly column names using make.names()
    xColNamesTable <- read.table("features.txt")
    xColNames <- make.names(xColNamesTable[,2])
    
    # read the X, Y, and Subject values from the test files and combine them
    # into a data frame
    testX <- read.table("test/X_test.txt", col.names = xColNames)
    testY <- read.table("test/y_test.txt", col.names = c('Activity'))
    testSubject <- read.table("test/subject_test.txt", col.names = c('Subject'))
    testX <- cbind(testSubject, testY, testX)
    
    # read the X, Y, and Subject values from the training files and combine them
    # into a data frame
    trainX <- read.table("train/X_train.txt", col.names = xColNames)
    trainY <- read.table("train/y_train.txt", col.names = c('Activity'))
    trainSubject <- read.table("train/subject_train.txt", col.names = c('Subject'))
    trainX <- cbind(trainSubject, trainY, trainX)
    
    # merge the data sets into a single data frame
    allData <- rbind(testX, trainX)
    
    ## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    # create a character vector of the column names to keep (Activity, Subject,
    # and all that contain "mean." or "std" - note that mean() in features.txt
    # becomes mean.. as a column name)
    colsToKeep <- c('Activity', 'Subject')
    colsToKeep <- append(colsToKeep, grep("mean\\.", xColNames, value = TRUE))
    colsToKeep <- append(colsToKeep, grep("std", xColNames, value = TRUE))
    
    # keep only those columns in the vector above
    allData <- allData[, (names(allData) %in% colsToKeep)]
    
    ## Step 3. Uses descriptive activity names to name the activities in the data set
    # read the activity labels from activity_labels.txt
    activityLabels <- read.table("activity_labels.txt", col.names = c('ID', 'Label'))
    
    # replace the numeric values in the Activity column of the addData data frame
    # with the descriptive textual labels
    allData$Activity <- activityLabels[,2][match(allData$Activity, activityLabels[,1])]
    
    ## Step 4. Appropriately labels the data set with descriptive variable names. 
    colnames(allData) <- c("Subject", "Activity", "tBodyAccelerationMeanX", "tBodyAccelerationMeanY", "tBodyAccelerationMeanZ", "tBodyAccelerationStdDevX", "tBodyAccelerationStdDevY", "tBodyAccelerationStdDevZ", "tGravityAccelerationMeanX", "tGravityAccelerationMeanY", "tGravityAccelerationMeanZ", "tGravityAccelerationStdDevX", "tGravityAccelerationStdDevY", "tGravityAccelerationStdDevZ", "tBodyAccelerationJerkMeanX", "tBodyAccelerationJerkMeanY", "tBodyAccelerationJerkMeanZ", "tBodyAccelerationJerkStdDevX", "tBodyAccelerationJerkStdDevY", "tBodyAccelerationJerkStdDevZ", "tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ", "tBodyGyroStdDevX", "tBodyGyroStdDevY", "tBodyGyroStdDevZ", "tBodyGyroJerkMeanX", "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkStdDevX", "tBodyGyroJerkStdDevY", "tBodyGyroJerkStdDevZ", "tBodyAccelerationMagnitudeMean", "tBodyAccelerationMagnitudeStdDev", "tGravityAccelerationMagnitudeMean", "tGravityAccelerationMagnitudeStdDev", "tBodyAccelerationJerkMagnitudeMean", "tBodyAccelerationJerkMagnitudeStdDev", "tBodyGyroMagnitudeMean", "tBodyGyroMagnitudeStdDev", "tBodyGyroJerkMagnitudeMean", "tBodyGyroJerkMagnitudeStdDev", "fBodyAccelerationMeanX", "fBodyAccelerationMeanY", "fBodyAccelerationMeanZ", "fBodyAccelerationStdDevX", "fBodyAccelerationStdDevY", "fBodyAccelerationStdDevZ", "fBodyAccelerationJerkMeanX", "fBodyAccelerationJerkMeanY", "fBodyAccelerationJerkMeanZ", "fBodyAccelerationJerkStdDevX", "fBodyAccelerationJerkStdDevY", "fBodyAccelerationJerkStdDevZ", "fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ", "fBodyGyroStdDevX", "fBodyGyroStdDevY", "fBodyGyroStdDevZ", "fBodyAccelerationMagnitudeMean", "fBodyAccelerationMagnitudeStdDev", "fBodyAccelerationJerkMagnitudeMean", "fBodyAccelerationJerkMagnitudeStdDev", "fBodyGyroMagnitudeMean", "fBodyGyroMagnitudeStdDev", "fBodyGyroJerkMagnitudeMean", "fBodyGyroJerkMagnitudeStdDev")
    
    ## Step 5. From the data set in step 4, creates a second, independent tidy 
    ## data set with the average of each variable for each activity and each subject.
    step5DataSet <- allData %>% group_by(Activity, Subject) %>% summarize_each(funs(mean))
    
    # save the data set from step 5 to a text file for submitting
    write.table(step5DataSet, "output.txt", row.names = FALSE)
}