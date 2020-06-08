library(dplyr)
filename <- "~/Desktop/UCI_HAR_Dataset/"


features <- read.table("~/Desktop/UCI_HAR_Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("~/Desktop/UCI_HAR_Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("~/Desktop/UCI_HAR_Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("~/Desktop/UCI_HAR_Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("~/Desktop/UCI_HAR_Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("~/Desktop/UCI_HAR_Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("~/Desktop/UCI_HAR_Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("~/Desktop/UCI_HAR_Dataset/train/y_train.txt", col.names = "code")


X<- rbind(x_train,x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
TidyData$code <- activities[TidyData$code, 2]





names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))




FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "~/Desktop/FinalData.txt", row.name=FALSE)

