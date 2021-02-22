setwd("~/Desktop/Coursera/Run_Analysis")
library("dplyr")

#0. READING FILES
trainSub <- read.table("train/subject_train.txt", col.names = "ID")
trainVal <- read.table("train/X_train.txt")
trainAct <- read.table("train/y_train.txt", col.names = "Activity")

testSub <- read.table("test/subject_test.txt", col.names = "ID")
testVal <- read.table("test/X_test.txt")
testAct <- read.table("test/y_test.txt", col.names = "Activity")

acts <- read.table("activity_labels.txt")
feat <- read.table("features.txt")

#1. Merges the training and the test sets to create one data set.
datAct <- rbind(cbind(trainSub, trainVal, trainAct), cbind(testSub, testVal, testAct))
colnames(datAct) <- c("ID", feat[,2], "Activity")

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
datAct <- datAct[,grep(pattern = "ID|std|mean|Activity", x = colnames(datAct))]

#3. Uses descriptive activity names to name the activities in the data set
datAct <- merge(datAct, acts, by.x="Activity", by.y="V1")
datAct$Activity <- NULL
colnames(datAct)[colnames(datAct)=="V2"] <- "Activity"

#4. Appropriately labels the data set with descriptive variable names. 
cols <- gsub("[\\(\\)-]", "", colnames(datAct))
cols <- gsub("BodyBody", "Body", cols)
cols <- gsub("^f", "frequencyDomain", cols)
cols <- gsub("^t", "timeDomain", cols)
cols <- gsub("Acc", "Accelerometer", cols)
cols <- gsub("Gyro", "Gyroscope", cols)
cols <- gsub("Mag", "Magnitude", cols)
cols <- gsub("Freq", "Frequency", cols)
cols <- gsub("mean", "Mean", cols)
cols <- gsub("std", "StandardDeviation", cols)
cols <- gsub("BodyBody", "Body", cols)
colnames(datAct) <- cols

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
means <- datAct %>% group_by(ID, Activity) %>% summarise_each(funs(mean))

write.table(means, "tidy_data.txt", row.names = FALSE, quote = FALSE)
