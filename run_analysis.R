library(data.table)
library(plyr)

# Download the dataset
path <- getwd()
print(path)
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path,filename))

# Unzip the dataset
unzip(filename)

# 1. Merge the training and test datasets

  # 1.1 Reading files
  
    # 1.1.1 Reading training datasets
    x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    
    # 1.1.2 Reading test datasets
    x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    
    # 1.1.3 Reading feature vector
    features <- read.table("UCI HAR Dataset/features.txt")
    
    # 1.1.4 Reading activity labels
    activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")

    # 1. Merge training and test sets to create one data set.
    dataFeatures <- rbind(x_train,x_test)
    dataSubject <- rbind(subject_train, subject_test)
    dataActivity <- rbind(y_train, y_test)
    
    # combine test and train of subject data and activity data, give descriptive labels
    names(dataFeatures)<- features$V2
    names(dataSubject) <- c("subject")
    names(dataActivity) <- c("activity")
    
    # combine subject, activity, and features data sets to create final data set.
    CombinedDataSet <- cbind(dataSubject,dataActivity,dataFeatures)
    
    # 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    MeanStdData<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
    
    # 3. Uses descriptive activity names to name the activities in the data set
    # group the activity column, re-name label of levels with activity Levels, and apply it to the data.
    selectedNames<-c(as.character(MeanStdData), "subject", "activity" )
    Data<-subset(CombinedDataSet,select=selectedNames)
    act_group <- factor(Data$activity)
    levels(act_group) <- activity_labels[,2]
    Data$activity <- act_group
    
    
    # 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    
  # write the tidy data to the working directory as "tidy_data.txt"
    Data2<-aggregate(. ~subject + activity, Data, mean)
    Data2<-Data2[order(Data2$subject,Data2$activity),]
    write.table(Data2, file = "tidydata.txt", row.names=FALSE)
