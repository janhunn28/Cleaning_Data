# Cleaning_Data
Week 4 - Getting and Cleaning Data Project


# Definition of Problem
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
