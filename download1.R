url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "ucidata.zip",method = "curl")
unzip("ucidata.zip")
file.rename("UCI HAR Dataset","ucidata")
