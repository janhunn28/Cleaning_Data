#run_analysis.R
# This R Script downloads the raw data from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# which contains recordings of activities from people wearing Samsung Galaxy SII smartphones.

#Load necessary R package(s)
library(dplyr)

# Check to see if file already exists in current working directory of /Data Science
# If it does not, download and unzip it.

if (!file.exists("UCI HAR Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile="UCI_HAR_data.zip")
  unzip("UCI_HAR_data.zip")
  
  # Use read.table to get the data into usable R files.
  
  # Read in the test data  
  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  
  # Read in the training data  
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
  
  
  #Step 1 - merge the test and training datasets by using rbind
  x_merge <- rbind(x_test, x_train)
  y_merge <- rbind(y_test, y_train)
  subject_merge <- rbind(subject_test, subject_train)
  
  #Get Feature data and replace name vector in x_merge
  feature_name <- read.table("./UCI HAR Dataset/features.txt")[,2]
  names(x_merge) <- feature_name
  
  #Step 2 - Search the merged x and retain only the std (standard deviation) and mean
  meanstd <- grepl("std\\(\\)|mean\\(\\)", feature_name)
  x_merge <- x_merge[,meanstd]
  
  #Step 3 - Update the y_merge file to replace with meaningful activity labels.
  act_label <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
  y_merge <- inner_join(y_merge,act_label,by="V1")
  
  
  #Step 4 - Appropriately label the various data sets with descriptive names.
  names(subject_merge) <- c("participantid")
  
  #Add subject(participant) and activity to prepend to x_merge mean and std data
  total_data <- cbind(subject_merge,y_merge$V2,x_merge)
  
  #Clean up and on way to creating Tidy Final Dataset
  names(total_data) <- tolower(names(total_data))
  names(total_data) <- gsub("-", "", names(total_data))
  names(total_data) <- gsub("\\(", "", names(total_data))
  names(total_data) <- gsub("\\)", "", names(total_data))
  names(total_data)[2] <- "activity"
  
  #Step 5 - Create independent tidy data with average of each variable for each participant and activity.
  avg_data <- ddply(total_data, .(participantid, activity), function(x) colMeans(x[, 3:68]))
  names(avg_data)[c(3:68)] <- paste0("mean",names(avg_data)[c(3:68)])
  write.table (avg_data, "tidy_data.txt", row.name=FALSE)
  
}   
