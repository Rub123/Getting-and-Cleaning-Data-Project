# Getting-and-Cleaning-Data-Project
This analysis is based on the "Human Activity Recognition Using Smartphones Dataset", Version 1.0
For more details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

this Repo includes the following files:

*	`README.md`
*	`CodeBook.md`: a code book with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information
*	`tidyData.csv`: the submitted tidy data set with the average of each variable for each activity and each subject 
*	`run_analysis.R`: R script to create the tidy data set from the Original "Human Activity Recognition Using Smartphones Dataset", Version 1.0

The goal of the assignment is to prepare tidy data that can be used for later analysis.
The original data was of experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
And data was collected Using its embedded accelerometer and gyroscope 	
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

More information about the experiments data can be found on the CodeBook.md of in the link above.

The original data source was in a zip file from the link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The original relevant data was stored in 6 separate text files 
- 'features.txt': List of all features – 561 feature vector with variables.
- 'activity_labels.txt': Links the class labels with their activity name - 6 activities (numbers and names).
- 'train/X_train.txt': Training set – 7352 observations (561 variables).
- 'train/y_train.txt': Training labels – 7352 rows of activities number.
- 'test/X_test.txt': Test set - 2947 observations (561 variables).
- 'test/y_test.txt': Test labels- 2947 rows of activities number.

The script `run_analysis.R` does the following:

1.	Load the libraries plyr & tidyverse
2.	Check if the data exists in the working directory and download (and unzip) the data if it does not exists
3.	Read the relevant data in to R
4.	Merges the training and the test sets to create one data set using cbind and rbind.
a.	Merges the test data using cbind(subject_test, test_labels,test_set)
b.	Merges the training data cbind(subject_train, train_labels,train_set)
c.	Merges the training and the test sets using rbind(train_data_Merge,test_data_Merge)
5.	Extracts only the measurements on the mean and standard deviation for each measurement using regular expression to index the feature vector and then using that vector to subset the merged data
6.	Uses descriptive activity names to name the activities in the data set using plyr join to match the activities name to the data
7.	Appropriately labels the data set with descriptive variable names – using gsub and regular expression to make descriptive names with "." as separator between words:
a.	replace prefix 't' to time
b.	replace prefix 'f' to frequency
c.	replace "()" and "-" with ""
d.	replace mean to Mean
e.	replace std to Str
f.	replace Acc to Accelerometer
g.	replace Gyro to Gyroscope
h.	replace Mag to Magnitude
i.	replace 2 "." in sequence
j.	remove "." from the end of names
8.	creates a second, independent tidy data set with the average of each variable for each activity and each subject (from the data in step 7) using group_by (subject and activity) and summarise_all with funs(mean) to calculate the average
9.	write.csv the
