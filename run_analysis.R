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
    
    
    # Now merge the test and training datasets by using rbind
    x_merge <- rbind(x_test, x_train)
    y_merge <- rbind(y_test, y_train)
    subject_merge <- rbind(subject_test, subject_train)
    names(subject_merge) <- c("participantid")
    
    
    #Get Feature data and replace name vector in x_merge
    feature_name <- read.table("./UCI HAR Dataset/features.txt")[,2]
    names(x_merge) <- feature_name
    
    #Search the merged x and retain only the std (standard deviation) and mean
    
    meanstd <- grepl("std\\(\\)|mean\\(\\)", feature_name)
    x_merge <- x_merge[,meanstd]
    
    #Update the y_merge file to replace with meaningful activity labels.
    act_label <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
    y_merge <- inner_join(y_merge,act_label,by="V1")
    
    #Add subject(participant) and activity to x_merge
    x_merge <- cbind(subject_merge,y_merge$V2,x_merge)
    
    #Clean up and create Tidy Final Dataset
    names(x_merge) <- tolower(names(x_merge))
    names(x_merge) <- gsub("-", "", names(x_merge))
    names(x_merge) <- gsub("\\(", "", names(x_merge))
    names(x_merge) <- gsub("\\)", "", names(x_merge))
    names(x_merge)[2] <- "activity"
    