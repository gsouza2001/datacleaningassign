Data Used and Transformations

The code "run_analysis.R" uses the data available in the folder "ucidata".  This directory is created by the script "download1.R", which downloads the following zip file (provided by the instructor)

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script "download1.R" then unzips the download the file, adn rename the resulting directory from "UCI HAR Dataset" to "ucidata"

Essentially, this original dataset in "ucidata" contains accelerometer and gyroscope measurements taken from smartphones in 30 different subjects, performing one of six different types of activities (laying, walking, etc.) A full description of this dataset, and where/how it was obtained is available at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The file "./ucidata/README.txt" in the folder "./ucidata" contains additional information about this original dataset.  

The code "run_analysis.R" reads the data from the following original files: 

"./ucidata/activity_labels.txt": Contains the mapping between the activity number (between 1 and 6), and the activity label.  For example, activity "1" is "WALKING"

"./ucidata/features.txt": Contains the names of the 561 different measurements collected, at different points in time, for each activity, and each subject.  

"./ucidata/test/X_test.txt": Each row contains values for each of the 561 measurements. The units are as described in "/ucidata/README.txt". There are 2,947 different rows, where each row is a different combinations of activity and subject, at a different point in time.  

"./ucidata/test/y_test.txt": An integer vector containing the activity number (between 1 and 6) in each of the 2,947 rows in the dataset "./ucidata/test/X_test.txt"

"./ucidata/test/subject_test.txt": An integer vector containing the subject number (between 1 and 30) in each of the 2,947 rows in the dataset "./ucidata/test/X_test.txt"

Similar datasets are contained in "./ucidata/train/X_train.txt", "./ucidata/train/y_train.txt", and "./ucidata/train/subject_train.txt", with the difference that each of them has 7,352 rows (instead of 2,947).  

The code "run_analysis.R" reads the data above as ".csv" files.  It then merges all the data contained in the "train" and "test" datasets, creating the data.frames "values", "activity", and "subject"; each with 10,299 rows (i.e., 2,947 from "test" and 7,352 from "train").  The dataframe "values" contains all the 10,299 values for each of the 561 measurements.  The dataframe "activity" contains the corresponding 10,299 activities, and the dataframe "subject" contains the corresponding 10,299 subjects. 

The code then keeps only variables of interest (-mean() and -std()), that is, it subsets the "values" dataset to contain only 66 variables (instead of 561).  This is done by using "grep" in the "features" dataset, which yields the indexes of the variables of interest.

Then, the code modifies the names of the variables, which are contained in the "features" dataset by removing the following characters "(", "(", and "-". In addition, it also transform all variable names to lower case, in accordance with the suggestion in the lectures.  For example, the variable  "tBodyAcc-mean()-X" is transformed into tbodyaccmeanx.  These are then used as the respective column names in the "values" dataset 

The code then adds two columns to the "values" dataset: activity, and subject, where activity is added not as a number, but the activity label. For example, "1" is now entered as "WALKING".  

The code then creates an independent, tidy data set with the average of all measurements by activity and subject.  To that end, the code creates an interaction of factors "subject" and "activity", which is used to split the "values" dataframe "values" and then use the sapply function to compute the average for each of the 66 variables (measurements).  

Some final cleaning up is necessary to create a tidy dataset.  These final steps are described as comments in the "run_analysis.R" code, as comments.   The code then creates a tidy datset file named "dat.txt" 

This "dat.txt"" file is a tidy data set containing the following columns: "subject", "activity", and then 66 columns (containing the average of each of the 66 variables that we were asked to include in the file).  All column names are in lower case letters, and do not contain any spaces or special characters, and are indicative of the variable name.  For example, column 3 name is: 

tbodyaccmeanx

This means the average value of the measurement " tBodyAcc-mean()-X" in the original data set.  This average value is computed as the average for each subject, and for each activity, as indicated in columns 1 and 2 of the tidy data set.    









