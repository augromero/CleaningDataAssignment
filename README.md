# CleaningDataAssignment
======================

This is the Cleaning Data Assignment.

The source data was taken from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (1)

The data is in the UCI HAR Dataset folder.

For the assignment I create the file run_analysis.R

#run_analisys function

## 1. Merging test and training data sets

- I read the column names from the UCI HAR Dataset/features.txt
- I read and stored the files UCI HAR Dataset/test/xtest.txt and UCI HAR Dataset/train/x_train.txt.
- I merged them with the rBind function
- I use the colnames function for assigning the column names to the data frame

## 2. Extracting the mean and standard deviation columns

- I used a regular expression to identify only the columns with the text "mean()" or "std()". Are excluded the columns like "meanFreq" because are different means meassures.
- I used the grep function for filtering the column names.
- I select those columns and stored in the meanStdData dataframe.

## 3. Descriptive activities names

- I read the file UCI HAR Dataset/act ivity_labels.txt to extract the activity names.
- I read and store the files UCI HAR Dataset/test/ytest.txt and UCI HAR Dataset/train/y_train.txt and merged them.
- I merged the activitys to the meanStdData dataframe.
- Using a "for" I replaced the id of the activities with their description.

## 4. Descriptive variable names

- I replaced the "-" with "_" and the brackets "()" with an empty character "". I think the column names are readable in that way.

## 5. New tidy data frame with all the variable means by activity and subject

- I read and merge the test and training subjects in the same way of the first and third points.
- I merged that column to my working data frame "meanStdDataActivitySubjects"
- I applied the aggregation function, grouping the measurements by activity and subject, applying the mean for all the records.
- The file augustoPoint5df.txt was created with the aggregated dataframe.


Augusto Romero Arango


(1) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
