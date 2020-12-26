# Week 4 Peer-graded assignment####
# Peer-graded Assignment: Getting and Cleaning Data Course Project
# Date: Dec 25, 2020
# Author: Koji Chono

# Assignment details####
# Create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Extra: Merge Inertial Signals

# 0. Load libraries required in this R script####
library(tidyr)
library(dplyr)
library(reshape2)

# 1. Merges the training and the test sets to create one data set.####
# AND 4. Appropriately labels the data set with descriptive variable names.

columnNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
features <- columnNames[, 2]

# Test data: load test data and label the data set, SubjectID and ActivityID
subjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
names(subjectID) <- "SubjectID"

testActivityLabels <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
names(testActivityLabels) <- "ActivityID"

testX <- read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE)
names(testX) <- features
test <- cbind(subjectID, testActivityLabels, testX)

# Train data: load train data and label the data set, SubjectID and ActivityID
subjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
names(subjectID) <- "SubjectID"

trainActivityLabels <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
names(trainActivityLabels) <- "ActivityID"

trainX <- read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE)
names(trainX) <- features
train <- cbind(subjectID, trainActivityLabels, trainX)

# Merge test data and train data
merged <- rbind(test, train)

# garbage collection and discard
rm("subjectID", "testActivityLabels", "testX", "test", "trainActivityLabels", "trainX", "train")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.####
# Use grep() to extract the mean and standard deviation for each measurement.
# Extracted dataset, "extractMean_Std", contains the mean, the standard deviation, SubjectID, and ActivityID as Column
nameColumn <- names(merged)
pattern_mean <- "*mean()*" #for the mean
pattern_std <- "*std()*" #for the standard deviation
extractMean_Std <- select(merged, "SubjectID" | "ActivityID" | grep(pattern_mean, nameColumn) | grep(pattern_std, nameColumn))

# 3. Uses descriptive activity names to name the activities in the data set####
extractMean_Std$ActivityID <- as.character(extractMean_Std$ActivityID)

extractMean_Std[extractMean_Std$ActivityID == 1, ]$ActivityID <- "WALKING"
extractMean_Std[extractMean_Std$ActivityID == 2, ]$ActivityID <- "WALKING_UPSTAIRS"
extractMean_Std[extractMean_Std$ActivityID == 3, ]$ActivityID <- "WALKING_DOWNSTAIRS"
extractMean_Std[extractMean_Std$ActivityID == 4, ]$ActivityID <- "SITTING"
extractMean_Std[extractMean_Std$ActivityID == 5, ]$ActivityID <- "STANDING"
extractMean_Std[extractMean_Std$ActivityID == 6, ]$ActivityID <- "LAYING"

extractMean_Std$ActivityID <- as.factor(extractMean_Std$ActivityID)
extractMean_Std$SubjectID <- as.factor(extractMean_Std$SubjectID)
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####
# melt "extractMean_Std" dataframe by SubjectID and ActivityID
dataMelt <- melt(extractMean_Std, id.vars = c("SubjectID", "ActivityID"),
                   variable.name = "Features",
                   value.name = "Values")

# Calculate mean of values for each measurement
dataGrouped <- dataMelt %>% group_by(SubjectID, ActivityID, Features)
resultsData <- dataGrouped %>% summarise(Average = mean(Values))


#Check the result dataset
head(resultsData)
tail(resultsData)
resultsData

# Export for submission
write.table(resultsData, file = "./tidyData.txt", row.names = FALSE, fileEncoding = "UTF-8")

