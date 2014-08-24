run_analysis <- function (){
        ##1. Merging Train and Test Data
        
        #Read and store column names (test/features.txt)
        
        columnNames <- read.table(file="UCI HAR Dataset/features.txt", header=FALSE)
        columnNames <- columnNames[, 2]
        
        
        
        #Read and store the test data
        if (!exists("testData")){
                testData <<- read.table(file="UCI HAR Dataset/test/X_test.txt", header=FALSE)
        }
        
        
        #Read and store the train data
        if (!exists("trainData")){
                trainData <<- read.table(file="UCI HAR Dataset/train/X_train.txt", header=FALSE)
                
        }
        
        #merge test and train data
        fullData <- rbind(testData, trainData)
        colnames(fullData) <- columnNames
        
        
        ##2. Extracting only the mean and standard deviation columns
        regExp <- "mean\\()|std\\()"
        extractedColumns <- columnNames[grep(regExp, columnNames)]
        extractedColumns
        
        meanStdData <- fullData[, as.vector(extractedColumns)]
        
        
        ##3. Adding activities to the dataset
        
        activityLabels <- read.table(file="UCI HAR Dataset/activity_labels.txt", header=FALSE)
        colnames(activityLabels) <-c("id_activity", "activity")
        
        
        #Read and store the test activities data
        if (!exists("testActivities")){
                testActivities <<- read.table(file="UCI HAR Dataset/test/y_test.txt", header=FALSE)
                
        }
        
        
        #Read and store the train activities data
        if (!exists("trainActivities")){
                trainActivities <<- read.table(file="UCI HAR Dataset/train/y_train.txt", header=FALSE)
                
        }
        
        #merge test and train data
        fullActivities <- rbind(testActivities, trainActivities)
        colnames(fullActivities) <- "Activity"
        
        
        for (i in unique(fullActivities$Activity)) {
               
               fullActivities[fullActivities == i] <- as.character(activityLabels[activityLabels$id_activity == i, 2])
        }
        
        meanStdDataActivities <- cbind(fullActivities, meanStdData)
        head(meanStdDataActivities)
        
        ##4. Descriptive variables names
        
        oldNames <- colnames(meanStdDataActivities)
        newNames <- gsub("-", "_", oldNames)
        newNames <- gsub("\\()", "", newNames)
        colnames(meanStdDataActivities) <- newNames
        head(meanStdDataActivities)
        
        ##5. TidyData of means by activity and subject
        #Read and store the test activities data
        if (!exists("testSubjects")){
                testSubjects <<- read.table(file="UCI HAR Dataset/test/subject_test.txt", header=FALSE)
                
        }
        
        
        #Read and store the train activities data
        if (!exists("trainSubjects")){
                trainSubjects <<- read.table(file="UCI HAR Dataset/train/subject_train.txt", header=FALSE)
                
        }
        
        #merge test and train data
        fullSubjects <- rbind(testSubjects, trainSubjects)
        colnames(fullSubjects) <- "subject"
        
        meanStdDataActivitySubjects <- cbind(fullSubjects, meanStdDataActivities)
        
        ds_nCols <- ncol(meanStdDataActivitySubjects)
        ds_by <- list(activity=meanStdDataActivitySubjects$Activity, subject=meanStdDataActivitySubjects$subject)
        dsAgrgate <- aggregate(meanStdDataActivitySubjects[, c(3:ds_nCols)], ds_by, mean)
        
        write.table(dsAgrgate, file="augustoPoint5ds.txt", row.names=FALSE)
}
run_analysis()