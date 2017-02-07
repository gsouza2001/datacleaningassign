# This code is for Programming Assignment in Week 4
# First, separately reads all the data 
names.measur <- read.table("./ucidata/features.txt",header = FALSE,colClasses = c("integer","character"))
activity.names <- read.table("./ucidata/activity_labels.txt",header = FALSE,colClasses = c("integer","character"))
values.test <- read.table("./ucidata/test/X_test.txt",header = FALSE)
activity.test <- read.table("./ucidata/test/y_test.txt",header = FALSE)
subject.test <- read.table("./ucidata/test/subject_test.txt",header = FALSE)
values.train <- read.table("./ucidata/train/X_train.txt",header = FALSE)
activity.train <- read.table("./ucidata/train/y_train.txt",header = FALSE)
subject.train <- read.table("./ucidata/train/subject_train.txt",header = FALSE)
# Now we merge test and train data sets together
values <- rbind(values.test,values.train)
activity <- rbind(activity.test,activity.train)
subject <- rbind(subject.test,subject.train)
# Now we keep only variables of interest (-mean() and -std()) for each measur.
# We also create better names for the variables by using only lower case letters
# and also removing symbols such as "-" and "()"
varToKeep <-  grep("mean\\(\\)|std\\(\\)",names.measur$V2)
namesToKeep <- names.measur[varToKeep,2]
namesToKeep <- tolower(gsub("-|\\(|\\)","",namesToKeep))
values <- values[,varToKeep]
names(values) <- namesToKeep
# Now, we use descriptive names for the activities in activity
# We also add the two columns, one with activity, and one with subject
library(plyr)
activity <- join(activity,activity.names)
values$activity <- activity[,2]
values$subject <- subject$V1
# Now, we create an independent, tidy data set with the average of all measurements
# by activity and subject
# First, we create an interaction of factors "subject" and "activity"
# This is used to spli the dataframe "values" to use the sapply function
factors <- interaction(as.factor(values$subject),as.factor(values$activity))
test <- split(values,factors)
test2 <- sapply(test,function(x) {colMeans(x[,1:66])})
# The matrix test2 has the rows as each of the measurements, and the columns
# are the interaction factors (e.g., "1.LAYING")
# we now create a list that splits the names of test2 by the "."
splitnames <- strsplit(colnames(test2),"\\.")
# We now recover the subjects (vector s), and activities (vector a) from 
# the list with the splitnames
s <- as.integer(sapply(splitnames,function(x) {x[1]}))
a <- sapply(splitnames,function(x) {x[2]})
# The final step is to create a tidy data frame where the columns are 
# subject, activity, and the averages of each of the 66 measurements
dat <- cbind(s,a)
for (i in 1:66) {
    dat <- cbind(dat,test2[i,])
}
colnames(dat) <- c("subject","activity",row.names(test2))
write.table(dat,"dat.txt",row.names = FALSE)

