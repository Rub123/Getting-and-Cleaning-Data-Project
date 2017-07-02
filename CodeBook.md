# Code Book for "tidyData.csv"

This analysis is based on the "Human Activity Recognition Using Smartphones Dataset", Version 1.0
For more details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The following code book is relevant for the file "tidyData.csv" which take the **average** , for each subject and activity, from the original experiment, only for estimated mean and Standard deviation on the original data.

## Original data relevant info
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
And data was collected Using its embedded accelerometer and gyroscope 	
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Original data Feature Selection info:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Transformations on the original data:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
I excluded the following features because in my understanding\interpretation of the required assignment, include them was less consistent and not necessary:  meanFreq, gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean.
But if one wishes to include then, all one have to do is use this regular expression "[Mm]ean|std" instead of "[Mm]ean\\(\\)|[Ss]td\\(\\)" in the script

1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**more comprehensive explanation can be found in the README file and the Script notes**

**tidyData.csv** – the data has 180 observations (rows) and 68 variables (columns, 2 id variables and 66 Feature variables)

## The ID variables

* subject: 1-30, 30 volunteers for the experiments
* activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,STANDING,LAYING


## The Feature variables that were included:
* All Features are normalized and bounded within [-1,1]
* All the data in the Features represents the average of the original Feature for each subject and activity
* X, Y and Z is used in the names of the variables to denote 3-axial signals

|Original variable names      |New descriptive variable names                        |
|-----------------------------|------------------------------------------------------|
| tBodyAcc-mean()-X           | Time.Body.Accelerometer.Mean.X                       |
| tBodyAcc-mean()-Y           | Time.Body.Accelerometer.Mean.Y                       |
| tBodyAcc-mean()-Z           | Time.Body.Accelerometer.Mean.Z                       |
| tBodyAcc-std()-X            | Time.Body.Accelerometer.Std.X                        |
| tBodyAcc-std()-Y            | Time.Body.Accelerometer.Std.Y                        |
| tBodyAcc-std()-Z            | Time.Body.Accelerometer.Std.Z                        |
| tGravityAcc-mean()-X        | Time.Gravity.Accelerometer.Mean.X                    |
| tGravityAcc-mean()-Y        | Time.Gravity.Accelerometer.Mean.Y                    |
| tGravityAcc-mean()-Z        | Time.Gravity.Accelerometer.Mean.Z                    |
| tGravityAcc-std()-X         | Time.Gravity.Accelerometer.Std.X                     |
| tGravityAcc-std()-Y         | Time.Gravity.Accelerometer.Std.Y                     |
| tGravityAcc-std()-Z         | Time.Gravity.Accelerometer.Std.Z                     |
| tBodyAccJerk-mean()-X       | Time.Body.Accelerometer.Jerk.Mean.X                  |
| tBodyAccJerk-mean()-Y       | Time.Body.Accelerometer.Jerk.Mean.Y                  |
| tBodyAccJerk-mean()-Z       | Time.Body.Accelerometer.Jerk.Mean.Z                  |
| tBodyAccJerk-std()-X        | Time.Body.Accelerometer.Jerk.Std.X                   |
| tBodyAccJerk-std()-Y        | Time.Body.Accelerometer.Jerk.Std.Y                   |
| tBodyAccJerk-std()-Z        | Time.Body.Accelerometer.Jerk.Std.Z                   |
| tBodyGyro-mean()-X          | Time.Body.Gyroscope.Mean.X                           |
| tBodyGyro-mean()-Y          | Time.Body.Gyroscope.Mean.Y                           |
| tBodyGyro-mean()-Z          | Time.Body.Gyroscope.Mean.Z                           |
| tBodyGyro-std()-X           | Time.Body.Gyroscope.Std.X                            |
| tBodyGyro-std()-Y           | Time.Body.Gyroscope.Std.Y                            |
| tBodyGyro-std()-Z           | Time.Body.Gyroscope.Std.Z                            |
| tBodyGyroJerk-mean()-X      | Time.Body.Gyroscope.Jerk.Mean.X                      |
| tBodyGyroJerk-mean()-Y      | Time.Body.Gyroscope.Jerk.Mean.Y                      |
| tBodyGyroJerk-mean()-Z      | Time.Body.Gyroscope.Jerk.Mean.Z                      |
| tBodyGyroJerk-std()-X       | Time.Body.Gyroscope.Jerk.Std.X                       |
| tBodyGyroJerk-std()-Y       | Time.Body.Gyroscope.Jerk.Std.Y                       |
| tBodyGyroJerk-std()-Z       | Time.Body.Gyroscope.Jerk.Std.Z                       |
| tBodyAccMag-mean()          | Time.Body.Accelerometer.Magnitude.Mean               |
| tBodyAccMag-std()           | Time.Body.Accelerometer.Magnitude.Std                |
| tGravityAccMag-mean()       | Time.Gravity.Accelerometer.Magnitude.Mean            |
| tGravityAccMag-std()        | Time.Gravity.Accelerometer.Magnitude.Std             |
| tBodyAccJerkMag-mean()      | Time.Body.Accelerometer.Jerk.Magnitude.Mean          |
| tBodyAccJerkMag-std()       | Time.Body.Accelerometer.Jerk.Magnitude.Std           |
| tBodyGyroMag-mean()         | Time.Body.Gyroscope.Magnitude.Mean                   |
| tBodyGyroMag-std()          | Time.Body.Gyroscope.Magnitude.Std                    |
| tBodyGyroJerkMag-mean()     | Time.Body.Gyroscope.Jerk.Magnitude.Mean              |
| tBodyGyroJerkMag-std()      | Time.Body.Gyroscope.Jerk.Magnitude.Std               |
| fBodyAcc-mean()-X           | Frequency.Body.Accelerometer.Mean.X                  |
| fBodyAcc-mean()-Y           | Frequency.Body.Accelerometer.Mean.Y                  |
| fBodyAcc-mean()-Z           | Frequency.Body.Accelerometer.Mean.Z                  |
| fBodyAcc-std()-X            | Frequency.Body.Accelerometer.Std.X                   |
| fBodyAcc-std()-Y            | Frequency.Body.Accelerometer.Std.Y                   |
| fBodyAcc-std()-Z            | Frequency.Body.Accelerometer.Std.Z                   |
| fBodyAccJerk-mean()-X       | Frequency.Body.Accelerometer.Jerk.Mean.X             |
| fBodyAccJerk-mean()-Y       | Frequency.Body.Accelerometer.Jerk.Mean.Y             |
| fBodyAccJerk-mean()-Z       | Frequency.Body.Accelerometer.Jerk.Mean.Z             |
| fBodyAccJerk-std()-X        | Frequency.Body.Accelerometer.Jerk.Std.X              |
| fBodyAccJerk-std()-Y        | Frequency.Body.Accelerometer.Jerk.Std.Y              |
| fBodyAccJerk-std()-Z        | Frequency.Body.Accelerometer.Jerk.Std.Z              |
| fBodyGyro-mean()-X          | Frequency.Body.Gyroscope.Mean.X                      |
| fBodyGyro-mean()-Y          | Frequency.Body.Gyroscope.Mean.Y                      |
| fBodyGyro-mean()-Z          | Frequency.Body.Gyroscope.Mean.Z                      |
| fBodyGyro-std()-X           | Frequency.Body.Gyroscope.Std.X                       |
| fBodyGyro-std()-Y           | Frequency.Body.Gyroscope.Std.Y                       |
| fBodyGyro-std()-Z           | Frequency.Body.Gyroscope.Std.Z                       |
| fBodyAccMag-mean()          | Frequency.Body.Accelerometer.Magnitude.Mean          |
| fBodyAccMag-std()           | Frequency.Body.Accelerometer.Magnitude.Std           |
| fBodyBodyAccJerkMag-mean()  | Frequency.BodyBody.Accelerometer.Jerk.Magnitude.Mean |
| fBodyBodyAccJerkMag-std()   | Frequency.BodyBody.Accelerometer.Jerk.Magnitude.Std  |
| fBodyBodyGyroMag-mean()     | Frequency.BodyBody.Gyroscope.Magnitude.Mean          |
| fBodyBodyGyroMag-std()      | Frequency.BodyBody.Gyroscope.Magnitude.Std           |
| fBodyBodyGyroJerkMag-mean() | Frequency.BodyBody.Gyroscope.Jerk.Magnitude.Mean     |

## The variables\Feature that were excluded:
Excluded all other Features
