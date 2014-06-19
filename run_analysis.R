## Run Analysis

run_analysis <- function () {
  
  ## ACTIVITIES ##
  # Import the activity labels, activity train data, and activity test data
  act_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")[,2]
  act_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")[,1]
  act_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")[,1]
  
  # Combine train and test data into single integer vector of activities
  act_indices <- c(act_train,act_test)
  
  # Create new factor vector of activities by indexing into labels vector with
  # integer vector 
  acts <- act_labels[act_indices]
  
  # Null out any data no longer needed (freeing up memory)
  act_labels <- act_train <- act_test <- act_indices <- NULL
  
  ## SUBJECTS ##
  # Import subject train and test data as separacter integer vectors
  subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")[,1]
  subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")[,1]
  
  # Combine train and test data into single integer vector of subjects
  subjects <- c(subject_train,subject_test)
  
  # Null out any data no longer needed (freeing up memory)
  subject_train <- subject_test <- NULL
  
  ## FEATURES ##
  # Import features and assign to character vector
  features <- read.table("data/UCI HAR Dataset/features.txt", 
                         stringsAsFactors=FALSE)[,2]
  
  # Find features containing a mean or standard deviation and save index to
  # an integer vector
  # Note: these indices indicate the columns of remaining data to be imported
  ind <- grep("([Mm]ean|[Ss]td)",features)
 
  # Column names determined by indexing into 
  col_names <- features[ind]
  
  # Columns to import for x data
  col_classes <- rep("NULL",561)
  col_classes[ind] <- "numeric"
 
  ## X DATA ##
  x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt",
                        colClasses = col_classes)
  x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt",
                       colClasses = col_classes)
  x <- rbind(x_train,x_test)
  colnames(x) <- col_names
  x_train <- x_test <- NULL
  
  ## OUTPUT ##
  full_df <- data.frame(subject = subjects,activity = acts,x)
  
  mean_cols
}