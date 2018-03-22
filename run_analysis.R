library(reshape2)

setwd("C:/Users/Andy/Dropbox/Work/Learning/DataScience/Getting and Cleaning Data")


##1. Merges the training and the test sets to create one data set.

#Read in train data and append two columns 
trainData <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
y_col = ncol(trainData) + 1
subject_col = ncol(trainData) + 2
trainData[,y_col] <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
trainData[,subject_col] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
#write.table(trainData, "UCI HAR Dataset/trainData.txt", sep="\t", row.names = FALSE, quote = FALSE)
#View(head(trainData))

#Read in test data and append two columns 
testData <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testData[,y_col] <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
testData[,subject_col] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#Combine both sets
data <- rbind(trainData, testData)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.

features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
grepSelectFeatures <- grep(".*mean.*|.*std.*", features[,2], ignore.case=TRUE)
featuresTimmed = features[grepSelectFeatures, ]
featuresTimmed[,2] = gsub('[()-]', '', featuresTimmed[,2])

data <- data[, c(grepSelectFeatures, y_col, subject_col)]
colnames(data) <- c(featuresTimmed$V2, "activity", "subject")

##3. Uses descriptive activity names to name the activities in the data set

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

##4. Appropriately labels the data set with descriptive variable names.

data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
data$subject <- as.factor(data$subject)

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##http://seananderson.ca/2013/10/19/reshape/
dataMelt <- melt(data, id = c("subject", "activity"))
#View(head(dataMelt))
dataAverage <- dcast(dataMelt, subject + activity ~ variable, mean)
#View(head(dataAverage))

write.table(dataAverage, "tidy.txt", sep="\t", row.names = FALSE, quote = FALSE)

