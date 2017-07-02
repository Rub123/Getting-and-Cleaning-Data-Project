library(plyr)
library(tidyverse)

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
Directory <- "UCI HAR Dataset"
fileName <- "Dataset.zip" 
# if data Directory doesn`t exist theh: if file exist theh unzipped the file
## else `download and unzipped the file
if (!file.exists(Directory)){
  if(file.exists(fileName)){
    unzip(fileName)  
  }
  else{
    download.file(dataUrl, fileName)   
    unzip(fileName)
  }
} 

# set the  Project data files  paths
activity_labels <- file.path(Directory ,"activity_labels.txt")
features <- file.path(Directory ,"features.txt")
subject_test <- file.path(Directory, "test", "subject_test.txt")
test_set <- file.path(Directory, "test", "X_test.txt")
test_labels <- file.path(Directory, "test", "y_test.txt")
subject_train <- file.path(Directory, "train", "subject_train.txt")
train_set <- file.path(Directory, "train", "X_train.txt")
train_labels <- file.path(Directory, "train", "y_train.txt")

# read the Project data to R
activity_labels <- read.table(activity_labels, col.names = c("activity","activity.labels"), stringsAsFactors = FALSE)
features <- read.table(features, col.names = c("index","features"), stringsAsFactors = FALSE)
subject_test <- read.table(subject_test, col.names = "subject")
test_set <- read.table(test_set)
test_labels <- read.table(test_labels, col.names = "activity")
subject_train <- read.table(subject_train, col.names = "subject")
train_set <- read.table(train_set)
train_labels <- read.table(train_labels, col.names = "activity")

## 1. Merges the training and the test sets to create one data set
test_data_Merge <- cbind(subject_test, test_labels,test_set)
train_data_Merge <- cbind(subject_train, train_labels,train_set)
Merged_data <- rbind(train_data_Merge,test_data_Merge)

# remove the unMerged data 
rm(subject_test,test_labels,test_set,subject_train, train_labels,train_set,test_data_Merge,train_data_Merge)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement 
# excluded : meanFreq, gravityMean, tBodyAccMean, tBodyAccJerkMean,tBodyGyroMean, tBodyGyroJerkMean
# if wish to include then use "[Mm]ean|std" instead of "[Mm]ean\\(\\)|[Ss]td\\(\\)" in the next code
varIndex <-  c(1,2) # "subject" & "labels.key" columns positions on the Merged_data
# varIndex is an index of columns number/position vector that preserve measurements only the
# measurements on the mean and standard deviation  + "subject" & "labels.key" columns
for(i in 1:nrow(features)){
    if(grepl("[Mm]ean\\(\\)|[Ss]td\\(\\)",features[i,2])){
        varIndex <- c(varIndex,as.numeric(features[i,1])+2)     
  }
}
Merged_data <- select(Merged_data,varIndex) ## Merged data 

## 3. Uses descriptive activity names to name the activities in the data set
Merged_data <- join(Merged_data, activity_labels, by = "activity")
Merged_data[,2] <- Merged_data[,"activity.labels"]
Merged_data <- select(Merged_data,-activity.labels)


## 4. Appropriately labels the data set with descriptive variable names
# get & set data columns names from features data
varNamesIndex <- varIndex[-(1:2)] -2
varNames <- features[varNamesIndex,2] # vector of measurements on the mean and standard deviation Names
#chang the names to more descriptive variable names
varNames <- gsub("^t","Time.",varNames) # replace prefix 't' to time
varNames <- gsub("^f","Frequency.",varNames) # replace prefix 'f' to frequency
varNames <- gsub("\\(\\)|-","",varNames) # replace "()" and "-" with ""
varNames <- gsub("mean",".Mean.",varNames) # so it will be easier to read
varNames <- gsub("std",".Std.",varNames) # so it will be easier to read
varNames <- gsub("Acc",".Accelerometer.",varNames) # replace "Acc" with ".Accelerometer."
varNames <- gsub("Gyro",".Gyroscope.",varNames) # replace "Gyro" with ".Gyroscope."
varNames <- gsub("Mag",".Magnitude.",varNames) # replace "Gyro" with ".Gyroscope."
varNames <- gsub("\\.\\.",".",varNames)  # remove ".." from the names
varNames <- gsub("\\.$","",varNames) # remove "." from the end of the names

names(Merged_data) <- c("subject", "activity",varNames )

## 5. From the data set in step 4, creates a second, independent tidy data set with the average
##of each variable for each activity and each subject
tidy_data <-  Merged_data %>%
    group_by(subject,activity ) %>%
    summarise_all(funs(mean))

write.csv(tidy_data, file = "tidyData.csv", quote = FALSE, row.names = FALSE)