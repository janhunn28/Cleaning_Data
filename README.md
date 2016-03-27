---
title: "README"
author: "Janice Hunnings"
date: "March 26, 2016"
---

#Cleaning Data Project Summary:
  Data was retrieved from measurements of various activities performed by participants wearing Samsung Galaxy S smartphones.  A script named run_analysis.R was written to create a tidy data set for further analysis.


#Raw Data
  The raw data was collected from the accelerometers from the Samsung Galaxy S smartphone and downloaded from this location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


#Summary of run_analysis.R Script
- Reads the data from UCI Machine Learning Repository mentioned above.
- Merges the associated test and training data sets to create one data set.
- Extracts only the mean and standard deviation for each measurement.
- Uses descriptive activity names to define the activities in the data set.
- Labels with dataset with descriptive, tidy variable names
- Creates a second, independent tidy data set with the average for each activity and subject.
 
#Data Description
   Data was collected from experiments with a group of 30 participants within an age bracket of 19-48
years.  Each person performed six activities while wearing the smartphone on their waist.  Using its embedded accelerometer and gyroscope,results were captured at a constant rate of 50 Hz.  The obtained data was randomly partitioned into two sets, where 70% were selected for generating the training data and 30% the test data.   

#Activities
There are six activities listed in the activity_label.txt file.  They are:
  1 - Walking
  2 - Walking Upstairs
  3 - Walking Downstairs
  4 - Sitting
  5 - Standing
  6 - Laying
  
#Steps to Create the Tidy Data Set for Analysis

Assumptions:
 - The user running the script has set their working directory appropriately using setwd().
 - The user has done an install.packages for dplyr.
 
1. Place the run_analysis.R script in this working directory folder.
3. Execute the run_analysis.R script by issuing source("run_analysis.R")
4. Review your working directory for a directory called UCI HAR dataset which contains the raw data.
5. View the resulting tidy_data.txt which contains the tidy data for further analysis.


#References
The data was supplied by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. from the 
University of Genoa, Genoa, Italy.

















