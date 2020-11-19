library(dplyr)

#loads activity data sets from test and train within working directory

testactivity  <- read.table("test/Y_test.txt" , header = FALSE)
trainactivity <- read.table("train/Y_train.txt", header = FALSE)

#loads subject data sets from test and train

testsubject  <- read.table("test/subject_test.txt", header = FALSE)
trainsubject <- read.table("train/subject_train.txt", header = FALSE)

#loads features data sets from test and train

testfeatures  <- read.table("test/X_test.txt", header = FALSE)
trainfeatures <- read.table("train/X_train.txt", header = FALSE)

#combines activity, subject, and features sets from test and train respectively
#Merges the training and the test sets to create one data set.

activity <- rbind(trainactivity, testactivity)
subject <- rbind(trainsubject, testsubject)
features <- rbind(trainfeatures, testfeatures)

#changes factor levels(1-6) to match activity labels
labels <- read.table("activity_labels.txt", header = FALSE)
activity$V1 <- factor(activity$V1, levels = as.integer(labels$V1), labels = labels$V2)
str(activity)

#names activity and subject columns

names(activity)<- c("Activity")
names(subject)<-c("Subject")

#names feature columns from features text file

featurestxt <- read.table("features.txt", head=FALSE)
names(features)<- featurestxt$V2

#selects columns with mean and standard deviation data and subsetting


col_feat_mean_std <- grep("mean\\(\\)|std\\(\\)", featurestxt$V2)
sub_features<-subset(features,select=col_feat_mean_std)
names(sub_features)

#Combines data sets with activity names and labels

subjectactivity <- cbind(subject, activity)
data_final <- cbind(sub_features, subjectactivity)
names(data_final)

#Clarifying time and frequency variables
names(data_final)<-gsub("^t", "time_", names(data_final))
names(data_final)<-gsub("^f", "frequency_", names(data_final))

#Creates new data set with subject and activity means

cleandata1 <- data_final %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)
head(cleandata1)

#Writes tidy data to text file
write.table(cleandata1, file = "cleandata.txt", row.name = FALSE)
