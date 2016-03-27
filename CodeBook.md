---
title: "CodeBook"
author: "Janice Hunnings"
date: "March 26, 2016"
---

#Cleaning Data Project Summary:

#Definition of Problem
  Wearable computing such as Fitbit, Nike and Jawbone Up are developing advanced algorithms to attract
new users.  The goal is to create a tidy data set which can be used for further analysis.  This tidy
data set will contain information collected from the accelerometers of the Samsung Galaxy S smartphone.

# Data Set Information
   Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities (Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing,
Laying) wearing a Samsung Galaxy S II on the waist.  Using its embedded accelerometer and gyroscope,
data captured was 3-arial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The obtained dataset has been randomly partitioned into two data sets where 70% of the volunteers were
selected for generating the training data and 30% the test data.

   The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and
then sampled in fixed-width sliding windows of 2.56 seconds and 50% overlap (128 readings/window).  The
sensor acceleration signaal which has gravitational and body motion components, was separated using
Butterworth low-pass filter into body acceleration and gravity.  The gravitational force was assumed
to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.  From
each window, a vector of features was obtained by calculating variables from the time and frequency
domain.

# Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope
- A 561-feature vector with time and frequency domain variables
- Its activity label
- An identifier of the subject who carried the equipment.

#Raw Data
  The raw data was collected from the accelerometers from the Samsung Galaxy S smartphone and downloaded from this location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
using download.file and the unzip utilities.

  A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Included are the following files:
  - test directory - containing the data from the randomly chosen 30% of participants
  - train directory - containing the data from the randomly chosen 70% of participants
  - activity_labels.txt -a factor variable vector to link the class labels with their activity name.
  - features.txt - List of all features.
  - features_info.txt - containing information about the variable used on the feature vector.
  - README.txt


#Detailed Feature Selection:
   The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

      tBodyAcc-XYZ
      tGravityAcc-XYZ
      tBodyAccJerk-XYZ
      tBodyGyro-XYZ
      tBodyGyroJerk-XYZ
      tBodyAccMag
      tGravityAccMag
      tBodyAccJerkMag
      tBodyGyroMag
      tBodyGyroJerkMag
      fBodyAcc-XYZ
      fBodyAccJerk-XYZ
      fBodyGyro-XYZ
      fBodyAccMag
      fBodyAccJerkMag
      fBodyGyroMag
      fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

      mean(): Mean value
      std(): Standard deviation
      mad(): Median absolute deviation 
      max(): Largest value in array
      min(): Smallest value in array
      sma(): Signal magnitude area
      energy(): Energy measure. Sum of the squares divided by the number of values. 
      iqr(): Interquartile range 
      entropy(): Signal entropy
      arCoeff(): Autorregresion coefficients with Burg order equal to 4
      correlation(): correlation coefficient between two signals
      maxInds(): index of the frequency component with largest magnitude
      meanFreq(): Weighted average of the frequency components to obtain a mean frequency
      skewness(): skewness of the frequency domain signal 
      kurtosis(): kurtosis of the frequency domain signal 
      bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
      angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

      gravityMean
      tBodyAccMean
      tBodyAccJerkMean
      tBodyGyroMean
      tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

#Resulting Tidy Data Set:
After running the run_analysis.R script, the user will have a tidy data set named tidy_data.txt.  This clean data contains the average of each variable for each activity and each subject for the mean and standard deviation categories, sorted by participantid.  Each row contains:

  1 - the participantid
  2 - name of activity
  3 - 


