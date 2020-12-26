# Extra: Merge Inertial Signals####
# Body acceleration
#  Test datasets
bodyAccXtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header = FALSE)
bodyAccYtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header = FALSE)
bodyAccZtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header = FALSE)
#  Training datasets
bodyAccXtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header = FALSE)
bodyAccYtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header = FALSE)
bodyAccZtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header = FALSE)
# Merged body acceleration datasets
mergedBodyAccX <- rbind(bodyAccXtest, bodyAccXtrain)
mergedBodyAccY <- rbind(bodyAccYtest, bodyAccYtrain)
mergedBodyAccZ <- rbind(bodyAccZtest, bodyAccZtrain)
# garbage collection and discard
rm("bodyAccXtest", "bodyAccYtest", "bodyAccZtest", "bodyAccXtrain", "bodyAccYtrain", "bodyAccZtrain")


# Body gyro
#  Test datasets
bodyGyroXtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header = FALSE)
bodyGyroYtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header = FALSE)
bodyGyroZtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header = FALSE)
#  Training datasets
bodyGyroXtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header = FALSE)
bodyGyroYtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header = FALSE)
bodyGyroZtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header = FALSE)
# Merged body acceleration datasets
mergedBodyGyroX <- rbind(bodyGyroXtest, bodyGyroXtrain)
mergedBodyGyroY <- rbind(bodyGyroYtest, bodyGyroYtrain)
mergedBodyGyroZ <- rbind(bodyGyroZtest, bodyGyroZtrain)
# garbage collection and discard
rm("bodyGyroXtest", "bodyGyroYtest", "bodyGyroZtest", "bodyGyroXtrain", "bodyGyroYtrain", "bodyGyroZtrain")


# Total acceleration 
totalAccXtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header = FALSE)
totalAccYtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header = FALSE)
totalAccZtest <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header = FALSE)
#  Training datasets
totalAccXtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header = FALSE)
totalAccYtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header = FALSE)
totalAccZtrain <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header = FALSE)
# Merged body acceleration datasets
mergedTotalAccX <- rbind(totalAccXtest, totalAccXtrain)
mergedTotalAccY <- rbind(totalAccYtest, totalAccYtrain)
mergedTotalAccZ <- rbind(totalAccZtest, totalAccZtrain)
# garbage collection and discard
rm("totalAccXtest", "totalAccYtest", "totalAccZtest", "totalAccXtrain", "totalAccYtrain", "totalAccZtrain")

