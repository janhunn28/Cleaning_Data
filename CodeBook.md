---
title: "CodeBook"
author: "Janice Hunnings"
date: "March 26, 2016"
---

Cleaning Data Project:
Assumptions:
The assumption is made that the user has set their working directory appropriately using setwd().
Assume the user has done an install.packages for dplyr.

Raw Data
The raw data was collected from the accelerometers from the Samsung Galaxy S smartphone. Data was downloaded from this location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
using download.file and the unzip utilities.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Reading in Data
Data was split in two directories.  The first was /test and the second was /train.  There was also an associated subject dataset for each which contained a row assigning each participant a number.
The data sets from the two directories /test and /train were merged using the rbind() function.  

Activities
There are six activities listed in the activity_label.txt file.  They are:
1 - Walking
2- Walking Upstairs
3 - Walking Downstairs
4 - Sitting
5 - Standing
6 - Laying
These were retrieved as factor variable by using a read.table on the features.txt file.
