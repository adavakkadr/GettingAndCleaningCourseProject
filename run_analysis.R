##prepare data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "Activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

## Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject_xy <- rbind(subject_train, subject_test)
Merged_xy <- cbind(Subject_xy, Y, X)

##Extracts only the measurements on the mean and standard deviation for each measurement.

MeanandStd <- Merged_xy %>% select(Subject, label, contains("mean"), contains("std"))

##descriptive activity names to name the activities in the data set
MeanandStd$label <- activities[MeanandStd$label, 2]

## Appropriately labels the data set with descriptive variable names

names(MeanandStd)[2] = "Activity"
names(MeanandStd)<-gsub("tBody", "TimeBody", names(MeanandStd))
names(MeanandStd)<-gsub("fBodyBody|fBody", "FrequencyBody", names(MeanandStd))
names(MeanandStd)<-gsub("tGravity", "TimeGravity", names(MeanandStd))
names(MeanandStd)<-gsub("Acc", "Accelerometer", names(MeanandStd))
names(MeanandStd)<-gsub("Gyro", "Gyroscope", names(MeanandStd))
names(MeanandStd)<-gsub("Mag", "Magnitude", names(MeanandStd))
names(MeanandStd)<-gsub("meanFreq", "MeanFrequency", names(MeanandStd))
names(MeanandStd)<-gsub("mean", "Mean", names(MeanandStd))
names(MeanandStd)<-gsub("std", "STD", names(MeanandStd))
names(MeanandStd)<-gsub("angle", "Angle", names(MeanandStd))
names(MeanandStd)<-gsub("gravity", "Gravity", names(MeanandStd))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
SummaryData <- MeanandStd %>%
  group_by(Subject, Activity) %>%
  summarise_all(list(mean))
write.table(SummaryData, "summaryData.txt", row.name=FALSE)
