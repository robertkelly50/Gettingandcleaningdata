
##Merges the training and the test sets to create one data set.


trainingset <- read.table("train/X_train.txt")
traininglabels <- read.table("train/y_train.txt")
testset <- read.table("test/x_test.txt")
testlabels <- read.table("test/y_test.txt")

x <- rbind(trainingset, testset)
y <- rbind(traininglabels, testlabels)


##Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
features_mean_std <- grep("std|mean\\(\\)", features$V2)
x_extract <- x[,features_mean_std]
names(x_extract) <- features[features_mean_std, 2]



##Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("activity_labels.txt")
y[,1] <- activity_labels[y[,1], 2]

names(y) <- "activity"


##Appropriately labels the data set with descriptive variable names.
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_all <- rbind(subject_train, subject_test)
names(subject_all) <- "subject"

all_data <- cbind(x_extract, y, subject_all)

##From the data set in step 4, creates a second, independent tidy 
##data set with the average of each variable for each activity and each subject.

library(plyr)
finaltidy <- ddply(.data = all_data, .variables = c("subject","activity"), .fun = numcolwise(mean))
write.table(finaltidy, "finaltidy.txt", row.names = FALSE)

