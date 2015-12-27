# Getting and Cleaning Data Course Project Code Book

## Source
The original data is available from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This project uses a copy of the data provided for students of this course that is available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Data Cleanup Work Completed
The run_analysis.R file contains a single function, run_analysis(). This function takes the raw data and completes all work necessary to create a tidy data set with the average of each mean and standard deviation variable for each activity and each subject. The steps completed in the file are:

1. Use read.table() to read in features.txt, test/X_test.txt, test/y_test.txt, test/subject_test.txt, train/X_train.txt, train/y_train.txt, and train/subject_train.txt and then combine them into a single data frame.
2. Determine the columns to keep and remove all others from the data frame
3. Using the activity labels in activity_labels.txt, replace the integer values in the Activity column with the more descriptive textual labels
4. Modify the column names to make them more descriptive
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject and save this data set to a file using write.table() with row.names = FALSE

## Variables

### Activity

A factor with 6 levels that identifies the activity being performed during the observation. Valid values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

### Subject

An integer value from 1 to 30 that identifies the study subject who performed the activity.

### Numeric Values

The remaining columns in the tidy data set are numeric values that represent the mean values of the column in the original data set when grouped by Subject and Activity. For example, the value in the tBodyAccelerationMeanX column in the first row of the data set is the mean value of all observations of the tBodyAccelerationMeanX variable where the first subject was observed laying.

The original values in these columns come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcceleration and tGravityAcceleration) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccelerationJerk and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccelerationMagnitude, tGravityAccelerationMagnitude, tBodyAccelerationJerkMagnitude, tBodyGyroMagnitude, tBodyGyroJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcceleration, fBodyAccelerationJerk, fBodyGyro, fBodyAccelerationJerkMagnitude, fBodyGyroMagnitude, fBodyGyroJerkMagnitude. (Note the 'f' to indicate frequency domain signals). 

Variables with names containing "Mean" are estimated mean values of the signals while those containing "StdDev" are estimated standard deviations of the signals.

Variable names ending in X, Y, or Z denote 3-axial signals in the X, Y and Z directions, respectively.

The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). The gyroscope units are rad/seg.

The numeric variable names are as follows:

* tBodyAccelerationMeanX
* tBodyAccelerationMeanY
* tBodyAccelerationMeanZ
* tBodyAccelerationStdDevX
* tBodyAccelerationStdDevY
* tBodyAccelerationStdDevZ
* tGravityAccelerationMeanX
* tGravityAccelerationMeanY
* tGravityAccelerationMeanZ
* tGravityAccelerationStdDevX
* tGravityAccelerationStdDevY
* tGravityAccelerationStdDevZ
* tBodyAccelerationJerkMeanX
* tBodyAccelerationJerkMeanY
* tBodyAccelerationJerkMeanZ
* tBodyAccelerationJerkStdDevX
* tBodyAccelerationJerkStdDevY
* tBodyAccelerationJerkStdDevZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdDevX
* tBodyGyroStdDevY
* tBodyGyroStdDevZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdDevX
* tBodyGyroJerkStdDevY
* tBodyGyroJerkStdDevZ
* tBodyAccelerationMagnitudeMean
* tBodyAccelerationMagnitudeStdDev
* tGravityAccelerationMagnitudeMean
* tGravityAccelerationMagnitudeStdDev
* tBodyAccelerationJerkMagnitudeMean
* tBodyAccelerationJerkMagnitudeStdDev
* tBodyGyroMagnitudeMean
* tBodyGyroMagnitudeStdDev
* tBodyGyroJerkMagnitudeMean
* tBodyGyroJerkMagnitudeStdDev
* fBodyAccelerationMeanX
* fBodyAccelerationMeanY
* fBodyAccelerationMeanZ
* fBodyAccelerationStdDevX
* fBodyAccelerationStdDevY
* fBodyAccelerationStdDevZ
* fBodyAccelerationJerkMeanX
* fBodyAccelerationJerkMeanY
* fBodyAccelerationJerkMeanZ
* fBodyAccelerationJerkStdDevX
* fBodyAccelerationJerkStdDevY
* fBodyAccelerationJerkStdDevZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdDevX
* fBodyGyroStdDevY
* fBodyGyroStdDevZ
* fBodyAccelerationMagnitudeMean
* fBodyAccelerationMagnitudeStdDev
* fBodyAccelerationJerkMagnitudeMean
* fBodyAccelerationJerkMagnitudeStdDev
* fBodyGyroMagnitudeMean
* fBodyGyroMagnitudeStdDev
* fBodyGyroJerkMagnitudeMean
* fBodyGyroJerkMagnitudeStdDev

