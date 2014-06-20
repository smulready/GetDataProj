GetDataProj
===========

run_analysis.R
------------

Creates two data frames from the UCI HAR Dataset:

   1) full_df: Contains all observations of original data set (both train and
       test) but only the subset of features containing a mean or standard
       deviation of a value

   2) tidy_df: Contains the mean of each feature in full_df, aggregated by
      subject and activity

 Each data frame is written to file specified by the fuction arguments
 [full_df_out_file] & [tidy_df_out_file], respectively
