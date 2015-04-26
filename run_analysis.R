# Step1.
# Merges the training and the test sets to create one data set.
# setwd and place data folder in the directory
trainData <- read.table("./data/train/X_train.txt")
# get file loaded and check the attributes
# dim(trainData) # 7352*561
# head(trainData)
trainLabel <- read.table("./data/train/y_train.txt")
# convert to table format
table(trainLabel)
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
# get file loaded and check the attributes
# dim(testData) # 2947*561
# head(testData)
testLabel <- read.table("./data/test/y_test.txt") 
# convert to table format 
table(testLabel) 
testSubject <- read.table("./data/test/subject_test.txt")
Data <- rbind(trainData, testData)
# dim(Data) # 10299*561
Label <- rbind(trainLabel, testLabel)
# get file loaded and check the attributes
# dim(Label) # 10299*1
Subject <- rbind(trainSubject, testSubject)
# dim(Subject) # 10299*1

# Step2. Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
features <- read.table("./data/features.txt")
# dim(features)  # 561*2
meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
# length(meanStd) # 66
Data <- Data[, meanStd]
# dim(Data) # 10299*66
names(Data) <- gsub("\\(\\)", "", features[meanStd, 2]) # remove "()"

# Step3. Uses activity names to name the activities in 
# the data set
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(activity[, 2])
activityLabel <- activity[Label[, 1], 2]
Label[, 1] <- activityLabel
names(Label) <- "activity"

# Step4. labels the data set with descriptive activity 
# names. 
names(Subject) <- "subject"
cleanedData <- cbind(Subject, Label, Data)
# dim(cleanedData) # 10299*68
# export first dataset
write.table(cleanedData, "cleaned_data.txt", row.name=FALSE)

# Step5. Creates a second, data set with the average of 
# each variable for each activity and each subject. 
subjectLen <- length(table(Subject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
meanData <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
meanData <- as.data.frame(meanData)
colnames(meanData) <- colnames(cleanedData)
# use of data.table attributes might be another option
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    meanData[row, 1] <- sort(unique(Subject)[, 1])[i]
    meanData[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    meanData[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
# head(Data2)
# View(Data2)
# export second dataset
write.table(meanData, "cleaned_mean.txt",row.name=FALSE)

# cleaned_mean <- read.table("./cleaned_mean.txt")
# head(cleaned_mean)
# View(cleaned_mean)
