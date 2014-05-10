## CodeBook

a code book for the run_analysis.R

###Script
run_analysis.R contains 5 parts:

1. load and merge the raw data of the subject.
2. extract the mean and std of each features.
3. descriptive activity names and appropriately labels. 
4. calculate the average of each variable for each subject and each activity.
5. output the tidy data get from the script.

###Variables, Data and Transformations

####part1:

trainSubject: the subject of training data set. (load from subject_train.txt)

trainLabels: the label of the activity of the training data set. (load from y_train.txt)

trainData: the raw data of training set.(load from X_train.txt)

trainDataSet: the training data set of subject, activity label and raw data.(The cbind() function will be used)

testSubject: the subject of test data set. (load from subject_test.txt)

testLabels: the label of the activity of the test data set. (load from y_test.txt)

testData: the raw data of test set.(load from X_test.txt)

testDataSet: the test data set of subject, activity label and raw data.(The cbind() function will be used)

dataSet: all of the raw data of the training data set and test data set.(The rbind() function will be used)


####part2:

featuresData: the features.(load from features.txt)

meanId: extract the measurement id contains the mean().(The grep() function will be used)

stdId: extract the measurement id contains the mean().(The grep() function will be used)

tidyDataSet: the tidy data set after extracting the mean() and std() measurements.(Note the id of each vars)

(colnames() will be used to name the vars)

####part3:

activityData: the activity lables.(load from features.txt)

i: the index of the loop.

####part4:

averageDataSet: the new tidy data with the average of each variable for each 
subject and each activity.(The rbind() function will be used)

subjectId: the subject index of the first loop(from 1 to 30, the number of 
subjects in the project).

activityId: the activity index of the second loop (from 1 to 6, the number of the activity in the project).

groupId: the index of the row whose subject is subjectId and activity is activityId.



