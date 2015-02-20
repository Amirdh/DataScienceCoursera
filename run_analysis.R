library(dplyr)
library(tidyr)
# read the x-test and x_train files and bind together

xtest<- read.table("UCI HAR Dataset/test/X_test.txt")
xtrain<- read.table("UCI HAR Dataset/train/X_train.txt")
xdata<- rbind(xtest, xtrain)

#reads the features.txt file and assign that as column names for the dataset created above.

features<- read.table("UCI HAR Dataset/features.txt")
colnames(xdata)<- features[,2]

# To extract the mean and standard deviation values from the above dataset.

selindex<- grep("(mean|std)\\(\\)",colnames(xdata))
xdata<- xdata[,selindex]

# Reads the subject_test and subject_train and binds it with the dataset

subjecttest<- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain<- read.table("UCI HAR Dataset/train/subject_train.txt")
subject<- rbind(subjecttest, subjecttrain)
colnames(subject) = "Subjects"
xdata<- cbind(subject, xdata)

# Reads the y_test and y_train (activities) files and binds

ytest<- read.table("UCI HAR Dataset/test/y_test.txt")
ytrain<- read.table("UCI HAR Dataset/train/y_train.txt")
ydata<- rbind(ytest, ytrain)
colnames(ydata)<- "Activity"

# Reads the activity.txt file and gives appropriate activity names

activity<- read.table("UCI HAR Dataset/activity_labels.txt")
ydata<- mutate(ydata, ActivityName = activity[Activity, 2])
ydata<- select(ydata, -Activity)
#write.table(merge(xdata, ydata, by.x = "Subjects", by.y = "Subjects"), file = "dataset.csv", append = FALSE)

# binds the activities with the dataset

xdata<- cbind(ydata, xdata)

# Tidying and writing it to a file

xdata<- arrange(xdata, Subjects, ActivityName)

xdata<- gather(xdata, Features, Value, 3 : ncol(xdata))

xdata<- group_by(xdata, Subjects, ActivityName, Features)

xdata<-  summarize(xdata, Value = mean(Value))

write.table(xdata, file = "TidyDataset.txt", append = FALSE, sep = "\t", row.names = FALSE, quote = FALSE)
