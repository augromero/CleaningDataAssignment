##codeBook 
##run_analisys function

# 1. Merging test and training data sets

a. I read the column names from the UCI HAR Dataset/features.txt
b. I read and stored the files UCI HAR Dataset/test/x_test.txt and UCI HAR Dataset/train/x_train.txt.
c. I merged them with the rBind function
d. I use the colnames function for assigning the column names to the data frame

# 2. Extracting the mean and standard deviation columns

a. I used a regular expression to identify only the columns with the text "mean()" or "std()". Are excluded the columns like "meanFreq" because are different means meassures.
b. I used the grep function for filtering the column names.
c. I select those columns and stored in the meanStdData dataframe.

# 3. Descriptive activities names

a. I read the file UCI HAR Dataset/act ivity_labels.txt to extract the activity names.
b. I read and store the files UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/train/y_train.txt and merged them.
c. I merged the activitys to the meanStdData dataframe.
d. Using a "for" I replaced the id of the activities with their description.

# 4. Descriptive variable names

a. I replaced the "-" with "_" and the brackets "()" with an empty character "". I think the column names are readable in that way.

# 5. New tidy data frame with all the variable means by activity and subject

a. I read and merge the test and training subjects in the same way of the first and third points.
b. I merged that column to my working data frame "meanStdDataActivitySubjects"
c. I applied the aggregation function, grouping the measurements by activity and subject, applying the mean for all the records.
