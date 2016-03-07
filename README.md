
# Getting and Cleaning Data - Course Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1. Loads the test, training, activity, features and subject data.
2. Extracts only the mean and standard deviation values from the test and training sets
3. Row binds the above test and training data values
4. Column binds the data frame obtained in the above step with activity and subject ids
5. Calculates second, independent tidy data set with the average of each variable for each activity and each subject.
6. Creates an activity label column which names the activities of the activityid
7. Sorts the data according to subjectid and activityid

