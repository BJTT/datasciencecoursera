# Peer Assessments of Getting and Cleaning Data Project

# This R script does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive activity names. 
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



# 1. load and merge the training, the test sets ,activity labels and subjects

# training data
trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
trainData<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainDataSet<-cbind(trainSubject,trainLabels,trainData)
# test data
testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
testData<-read.table("./UCI HAR Dataset/test/X_test.txt")
testDataSet<-cbind(testSubject,testLabels,testData)
# merge training data set and test data set
dataSet<-rbind(trainDataSet,testDataSet)


# 2. extract the mean and std of each features
# get the id and names from the features.txt

featuresData<-read.table("./UCI HAR Dataset/features.txt",colClasses = "character")
# Id of the mean()
meanId<-grep("-mean()",featuresData[,2],fixed=TRUE)
# Id of the std()
stdId<-grep("-std()",featuresData[,2],fixed=TRUE)
# +2 for the 1st and the 2nd are the subject and  the activity
tidyDataSet<-dataSet[,sort(c(1,2,meanId+2,stdId+2))]
# names of var
colnames(tidyDataSet)<-c("subject","activity",featuresData[sort(c(meanId,stdId)),2])


# 3. descriptive activity names & 4. appropriately labels  

# 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS
# 4 SITTING 5 STANDING 6 LAYING

activityData<-read.table("./UCI HAR Dataset/activity_labels.txt",colClasses = "character")
for (i in c(1:6)){
  tidyDataSet[tidyDataSet[,2]==i,2]<-activityData[i,2]  
}


# 5. creates the tidy data set with the average of 
#  each variable for each activity and each subject. 
averageDataSet<-NULL # the data set of the average of each variable for each subject and activity
for (subjectId in c(1:30)){
  for (activityId in c(1:6)){
    # get the group id of each subject and each activity
    groupId<-tidyDataSet[,1]==subjectId & tidyDataSet[,2]==activityData[activityId,2]
    # combine each group
    averageDataSet<-rbind(averageDataSet,
                          c(subject=subjectId,activity=activityData[activityId,2],apply(tidyDataSet[groupId,c(-1,-2)],2,mean)))
  }
}

# 6. export the txt file of averageDataSet as newTidyData.txt
write.table(averageDataSet,"newTidyData.txt",quote=FALSE,sep=" ")
