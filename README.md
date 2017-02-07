This file explains how to run the script for 
Programming Assignment  - Week 4 of Data Cleaning Course

In your working directory, you should have the following file "download1.R".  This file downloads the zip file from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It then unzips the file, and renames the directory from "UCI HAR Dataset" to "ucidata".  To run this file, type:

source("download1.R")

After this, there will be a directory named "ucidata" in your working directory, with subdirectories "test" and "train". 

In addition, in your working directory, you should have the main R script file named "run_analysis.R", which performs all the analysis. The file "run_analysis.R" is appropriately commented, indicating all the steps performed; additional details are contained in the codebook "Data_transformations.md".  To run "run_analysis.R", type

source(run_analysis.R)

This will create a file named "dat.txt" in your working directory.  This "dat.txt" file is a tidy data set containing the following columns: "subject", "activity", and then 66 columns (for each of the measurements that we were asked to include in the file).  All column names are in lower case letters, and do not contain any spaces or special characters, and are indicative of the measurement name.  For example, column 3 name is: 

tbodyaccmeanx

This means the average value of the measurement " tBodyAcc-mean()-X" in the original data set.  The average value is the average for each subject, and for each activity, as indicated in columns 1 and 2 of the tidy data set.    

As another example, column 6 name is: 

tbodyaccstdx

This means the average value of the measurement " tBodyAcc-std()-X" in the original data set.  The average value is the average for each subject, and for each activity, as indicated in columns 1 and 2 of the tidy data set.

The codebook "Data_transformations.md" contains the description of the data and all transformations performed in the data.  

