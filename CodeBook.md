# The site where the data was obtained
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# The data for the project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The run_analysis.R script performs the following steps to clean the data:
### 1) Read following files X_train.txt, y_train.txt, subject_train.txt from the "./data/train" folder
### 2) Store them in trainData, trainLabel and trainSubject variables.
### 3) Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder
### 4) Store them in testData, testLabel and testsubject variables.
### 5) Concatenate testData to trainData to generate a 10299x561 data frame to Data
### 6) Concatenate testLabel to trainLabel to generate a 10299x1 data frame to Label
### 7) Concatenate testSubject to trainSubject to generate a 10299x1 data frame to Subject.
### 8) Read the features.txt file from the "/data" folder
### 9) Store the data in a variable called features
### 10) Only the the mean and standard deviation measurements are extracted
### 11) This results in a 66 indices list
### 12) Get a subset of Data with the 66 corresponding columns.
### 13) Clean the column names of the subset by removing "()".
### 14)	Read the activity_labels.txt file from the "./data"" folder
### 15) Store the data in a variable called activity.
### 16) Trasnform the activity names lo lower cases.
### 17)	Transform the values of Label according to the activity data frame.
### 18)	Combine the Subject, Label and Data by column to get a new cleaned 10299x68 data frame, cleanedData.
### 19) Name the first two columns, "subject" and "activity".
### 20) The "subject" column contains integers that range from 1 to 30
### 21) The "activity" column contains 6 kinds of activity names
### 22) The last 66 columns contain measurements that range from -1 to 1 exclusive.
### 23)	Write the cleanedData out to "cleaned_data.txt" file in current working directory.
### 24) Create a second data frame with the average of the different measurements by activity and subject. 
### 25) We have 30 unique subjects and 6 unique activities, giving 180 combinations by 68 columns
### 26) Write the result out to "cleaned_mean.txt" file in current working directory
