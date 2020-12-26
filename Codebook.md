## Code Book for run_analysis.R script
The run_analysis.R script run the dataset preparation and output followed by the steps required as described in the Coursera Getting and Cleaning Data Course Project definition.


## Download the given dataset from the provided URL link
Dataset should be downloaded and extracted under a folder called UCI HAR Dataset befor that. 

Original data is available from UCI Machine Learning Repository
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)




## 1. Merges the training and the test sets to create one data set and 4. appropriately labels the data set with descriptive variable names
Here I have used the `rbind()` function to combine "test" and "train" objects to the object called "merged".

##### Assign temporary objects for each of the datasets
`columnNames` is an object from `./UCI HAR Dataset/features.txt`.
`features` is a subset of `columnNames` for header labels. 
`subjectID` is an object from `./UCI HAR Dataset/test/subject_test.txt` or `./UCI HAR Dataset/train/subject_train.txt`.
`testActivityLabels` is an object from `./UCI HAR Dataset/test/y_test.txt`.
`testX` is an object from `./UCI HAR Dataset/test/x_test.txt`.
`test` is a combined dataset object from `subjectID`, `testActivityLabels`, ans `testX`.
`trainActivityLabels` is an object from `./UCI HAR Dataset/train/y_train.txt`.
`trainX` is an object from "./UCI HAR Dataset/train/x_train.txt".
`train` is a combined dataset object from `subjectID`, `trainActivityLabels`, and `trainX`.


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use the `grep()` function to extract the mean and standard deviation for each measurement.
Extracted dataset objects, `extractMean_Std`, contains the mean, the standard deviation, `SubjectID`, and `ActivityID` as the column names

### Temporary objects
`nameColumn` contains the header characters of `merged` object.
`pattern_mean` contains the pattern sring for picking up the mean.
`pattern_std` contains the pattern string for picking up the standard deviation.
`extractMean_Std` is the sub data set of `merged` object using the `select()` function and the `grep()` function.


## 3. Uses descriptive activity names to name the activities in the data set
Here I have matched the number (ID) of Activity with descriptive activity character. Moreover, the class of both `ActivityID` and `SubjectID` columns were converted to `Factor`.


## 4. Appropriately labels the data set with descriptive variable names. 
This step is included in the first step.

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
In the final step, I have melted, calculated and summarized the dataset of `extractMean_Std`, and then exported the dataset `resultsData` to the TXT file.

### Temporary objects
`dataMelt` is melted data from c`extractMean_Std` object using `SubjectID` and `ActivityID` as key variables.
`dataGrouped` is grouped by `SubjectID`, `ActivityID`, and `Features` columns.
`resultsData` contains the final result dataset for exporting.
