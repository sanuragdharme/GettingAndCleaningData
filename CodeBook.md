## Getting and Cleaning Data Project

### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Source Data
One of the most exciting areas in all of data science right now is wearable computing - see for example 
this article 
. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
## Please see the README.md for how the following instructions are implemented 
### 1. Merge the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names.
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data Variables
The data in the files have x_test, y_test, subject_test, x_train, y_train, and subject_train.
activity_labels : Description of activity IDs in y_test and y_train
features : description(label) of each variables in X_test and X_train
dataFeatures : bind of X_train and X_test
dataSubject : bind of subject_train and subject_test
dataActivity : bind of y_train and y_test
CombinedDataSet bind of dataFeatures,dataSubject,dataActivity
Output tidy data as tidydata.txt

