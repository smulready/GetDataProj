## Run Analysis

run_analysis <- function () {
  # Train Data
  subject_test <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
  x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")
  body_acc_x_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
  body_acc_y_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
  body_acc_z_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
  body_gyro_x_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
  body_gyro_y_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
  body_gyro_z_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
  total_acc_x_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
  total_acc_y_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
  total_acc_z_train <- read.table("data/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
  
  # Test Data
  subject_test <- read.table("data/UCI HAR Dataset/train/subject_test.txt")
  x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")
  body_acc_x_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
  body_acc_y_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
  body_acc_z_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
  body_gyro_x_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
  body_gyro_y_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
  body_gyro_z_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
  total_acc_x_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
  total_acc_y_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
  total_acc_z_test <- read.table("data/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
  
  
}