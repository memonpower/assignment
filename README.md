Getting and Cleaning Data Course Project This repository contains the
submission of the project of “Getting and Cleaning Data Coursera
course”. •First, download and unzip the data file into your R working
directory. •Second, download the R source code into your R working
directory. •Finally, execute R source code to generate tidy data file.

Data description The variables in the data X are sensor signals measured
with waist-mounted smartphone from 30 subjects. The variable in the data
Y indicates the different types of activity that the subjects made.

Code explaination In the code there were combined training dataset and
test dataset, and extracted partial variables. All this together create
another dataset with the averages of each variable for each activity.

New dataset The new dataset that were generated has variables calculated
that are based on the mean and standard deviation. Each row of the
dataset is an average of each activity type for all subjects.

The code was written based on the instruction of this assignment

The R script called run\_analysis.R does the following thigs: •Fist:
Merges the training and the test sets to create one data set. •Second:
Extracts only the measurements on the mean and standard deviation for
each measurement. •Third: Uses descriptive activity names to name the
activities in the data set •Fourth: Appropriately labels the data set
with descriptive variable names. •Fifth: From the data set in step 4,
creates a second, independent tidy data set with the average of each
variable for each activity and each subject.
