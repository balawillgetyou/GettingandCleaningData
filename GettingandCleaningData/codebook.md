
---
title: "Codebook for the course project for Getting and Cleaning Data"
author: "Bala Kesavan"
date: "17th June 2015"
output:
  html_document:
    keep_md: yes
---
 
## Project Description
The tidy data produced in this project is a data frame of 180 rows by 68 columns that basically provides aggregate linear and angular acceleration information resulting from 30 different people performing 6 different activities.
 
##Creating the tidy datafile
 
1. Instrctions for the project was posted at https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions
2. Requisite data was hosted at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. The README.md file at this location describes the operation of the script used to prepare tidy data: https://github.com/balawillgetyou/GettingandCleaningData/blob/master/README.md
 
###Cleaning of the data
The script prepared for this project reads input data in pieces and combines them, extracts the relevant subset, groups and summarizes to produce the required output that shows a set of subjects performing a set of activities and the measurement (aggregate) of physical movements.

The README.md file at this location provides a more detailed description: https://github.com/balawillgetyou/GettingandCleaningData/blob/master/README.md
 
##Description of the variables in the tiny_data.txt file

 
The tidy data produced in this project is a data frame of 180 rows by 68 columns that basically provides linear and angular acceleration information resulting from 30 different people performing 6 different activities.

The first of the 68 columns lists these activities. The second column identifies the subject (person who performed the activity). The contents of these two columns repeat in a pattern to show how each activity being performed by each subject. Hence 6 activity x 30 subjects = 180 rows.

Each of the remaining 66 columns is the average of individual readings resulting from the subjects performing the activities. Some are linear, others angular. Some show mean data, others standard deviation. During the transformations, the names of these 66 columns were tweaked to remove special characters. The temptation to force a change in names just for the sake of doing so has been resisted. "average" could have been prefixed to all column names but this would make the names even longer and less readable.

[Note to peer reviewers: I don't know enough of this domain to explain what each column actually measures. For example how is "tBodyGyroJerkstdZ" different from "tGravityAccMagstd"? As for units of measure, I know that standard deviation does not have one but raw velocity and acceleration do. But does normalized data have units?]

