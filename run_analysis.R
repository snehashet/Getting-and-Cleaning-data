# Getting-and-Cleaning-data
run_analysis<-function()
{
#load test data
       X_test<-read.table("test/X_test.txt")
       Y_test<-read.table("test/y_test.txt")
       sub_test<-read.table("test/subject_test.txt")
       
#load training data       
       X_train<-read.table("train/X_train.txt")
       Y_train<-read.table("train/y_train.txt")
       sub_train<-read.table("train/subject_train.txt")
       
# features and activities       
       features<-read.table("features.txt", col.names = c("featureid","featurelabel"))
       activities<-read.table("activity_labels.txt", col.names = c("activity","activitylabel"))
       activities$activitylabel<-gsub("_","",activities$activitylabel)
       
       
#merge test and training data and extract only mean and std
       
     meanstd_index <-grep("mean|std",features$featurelabel) 
    
     test<-rbind(X_test[,meanstd_index],X_train[,meanstd_index])
     colnames(test)<- grep("mean|std",features$featurelabel,value = TRUE)
     Y<-rbind(Y_test[],Y_train[])
     colnames(Y)<- "activity"
     subject<-rbind(sub_train[],sub_test[])
     colnames(subject)<-"subjectid"
     
     test<-cbind(test,Y,subject)
     
     library(dplyr)

     library(data.table)
     newddf<-data.table(test)

     tidy<-newddf[,lapply(.SD,mean),by=c("subjectid","activity")]
     tidy<-merge(tidy,activities,by="activity")
     tidy<-arrange(tidy,subjectid)
     write.table(tidy,"tidy.txt", row.names = FALSE)
       
}
