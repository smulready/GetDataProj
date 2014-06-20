## Run Analysis
#
# Creates two data frames from the UCI HAR Dataset:
#
#   1) full_df: Contains all observations of original data set (both train and
#       test) but only the subset of features containing a mean or standard
#       deviation of a value
#
#   2) tidy_df: Contains the mean of each feature in full_df, aggregated by
#      subject and activity
#
# Each data frame is written to file specified by the fuction arguments
# [full_df_out_file] & [tidy_df_out_file], respectively

run_analysis <- function (full_df_out_file="full_df.csv",
                          tidy_df_out_file = "tidy_df.csv") {
    ## SUBJECTS ##
    # Import subject train and test data and combine into single integer vector
    subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")[,1]
    subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")[,1]
    subjects <- c(subject_train,subject_test)
    
    ## ACTIVITIES ##
    # Import activity test and train data and combine into single integer vector
    act_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")[,1]
    act_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")[,1]
    act_indices <- c(act_train,act_test)
    
    # Import activity labels and create new factor vector by indexing into it
    # with activity integer vector
    act_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")[,2]
    acts <- act_labels[act_indices]
    
    ## FEATURES ##
    # Import all features as character vector and create a vector containing the
    # index of features containing a mean or standard deviation
    features <- read.table("data/UCI HAR Dataset/features.txt",
                           stringsAsFactors=FALSE)[,2]
    ind <- grep("([Mm]ean|[Ss]td)",features)
    
    # Create a vector specifying which columns of the main data to import
    col_classes <- rep("NULL",length(features))
    col_classes[ind] <- "numeric"
    
    # Import train and test pieces of the main data, only including columns
    # of features containing a mean or standard deviation
    x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt",
                          colClasses = col_classes)
    x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt",
                         colClasses = col_classes)
    
    # Combine train and test into a single data frame and add column names                                                              
    x <- rbind(x_train,x_test)
    colnames(x) <- features[ind];
    
    ## OUTPUT ##
    # 1) Combine all data into a single data frame
    # 2) Create an aggregate data frame providing mean by subject and activity
    # 3) Write data to file
    full_df <- data.frame(subject = subjects,activity = acts,x)
    tidy_df <- aggregate(full_df[,c(-1,-2)],full_df[,c(1,2)], mean)
    write.csv(full_df,"full_df.csv");
    write.csv(tidy_df,"tidy_df.csv");
}