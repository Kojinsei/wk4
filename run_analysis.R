# Week 4 Peer-graded assignment####
# Peer-graded Assignment: Getting and Cleaning Data Course Project
# Original date: Dec 25, 2020
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
requiredPkgs <- c("tidyr", "dplyr", "reshape2", "data.table")
sapply(requiredPkgs, require, character.only=TRUE, quietly=FALSE)
rm(requiredPkgs)

## Get working directory
wd <- getwd()

## Load dataset from Coursera
filename <- "DatasetFiles.zip"
folderName <- "UCI HAR Dataset"

### Checking archive
if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, file.path(wd, filename), method="curl")
}  

### Checking folder
if (!file.exists(folderName)) { 
      unzip(filename) 
}

# 1. Merges the training and the test sets to create one data set.####
# AND 4. Appropriately labels the data set with descriptive variable names.
activityLabels <- fread(file.path(wd, folderName, "activity_labels.txt"),
                        col.names = c("activityLevels", "activityNames"))
featureNames <- fread(file.path(wd, folderName, "features.txt"), header = FALSE,
                     col.names = c("ID", "features"))

# Test data: load test data and label the data set, SubjectID and ActivityID
subjectID <- fread(file.path(wd, folderName, "test/subject_test.txt"), header = FALSE,
                   col.names = "SubjectID")
testActivityLabels <- fread(file.path(wd, folderName, "test/y_test.txt"), header = FALSE,
                            col.names = "ActivityID")
testX <- fread(file.path(wd, folderName, "test/x_test.txt"), header = FALSE, 
               col.names = featureNames$features)
test <- cbind(subjectID, testActivityLabels, testX)

# Train data: load train data and label the data set, SubjectID and ActivityID
subjectID <- fread(file.path(wd, folderName,"train/subject_train.txt"), header = FALSE,
                   col.names = "SubjectID")
trainActivityLabels <- fread(file.path(wd, folderName,"train/y_train.txt"), header = FALSE,
                             col.names = "ActivityID")
trainX <- fread(file.path(wd, folderName, "train/x_train.txt"), header = FALSE,
                col.names = featureNames$features)
train <- cbind(subjectID, trainActivityLabels, trainX)

# Merge test data and train data
merged <- rbind(test, train)

# garbage collection and discard
rm(subjectID, testActivityLabels, testX, test, trainActivityLabels, trainX, train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.####
# Use grep() to extract the mean and standard deviation for each measurement.
# Extracted dataset, "extractMean_Std", contains the mean, the standard deviation, SubjectID, and ActivityID as Column

pattern_mean <- "mean\\(\\)*" #for the mean
pattern_std <- "std\\(\\)*" #for the standard deviation

extractMean_Std <- select(merged, "SubjectID" | "ActivityID" | grep(pattern_mean, names(merged)) | grep(pattern_std, names(merged)))

names(extractMean_Std) <- gsub("[()]", "", names(extractMean_Std))

rm(pattern_mean, pattern_std)

# 3. Uses descriptive activity names to name the activities in the data set####
extractMean_Std[["SubjectID"]] <- as.factor(extractMean_Std[, SubjectID])
extractMean_Std[["ActivityID"]] <- factor(extractMean_Std[, ActivityID],
                                  levels = activityLabels[["activityLevels"]],
                                  labels = activityLabels[["activityNames"]])


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####
# melt "extractMean_Std" dataframe by SubjectID and ActivityID
dataMelt <- melt(data = extractMean_Std,
                 id.vars = c("SubjectID", "ActivityID"),
                 variable.name = "Features",
                 value.name = "Values")

## Calculate mean of Values
resultsData1<- as_tibble(
      dcast(data = dataMelt,
      SubjectID + ActivityID ~ Features,
      value.var = "Values",
      fun.aggregate = mean))

resultsData2 <- dataMelt %>% group_by(SubjectID, ActivityID, Features) %>% summarise(Average = mean(Values))

#Check the result dataset
resultsData1
resultsData2

rm(activityLabels, featureNames, extractMean_Std, dataMelt)

# Export for submission
data.table::fwrite(x = resultsData1, file = "tidyData1.txt", quote = FALSE)
data.table::fwrite(x = resultsData2, file = "tidyData2.txt", quote = FALSE)

