# Code Book
_Data Set Code Book: "Getting and Cleaning Data" Course Project_

### Table of Contents

* [Raw Data](raw-data)
* [Tidy Data Summary](tidy-data-summary)
* [Variables](variables)

### Raw Data

This project works with the [Human Activity Recognition Using Smartphones Dataset][har-project] (data downloadable [here][har-dataset]). The raw data was a given and the details of it's capture are beyond the scope of this project.

[har-project]: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[har-dataset]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Tidy Data Summary

The data is stored in a text file in a space-delimited table. This data can be read into R with the following command:

    tidy.data <- read.table("tidy_data.txt", header=TRUE)

There are two descriptive variables, the `Subject` and the `Activity`, and 66 average measurement variables. The study included 30 subjected, each engaging in 6 activities. 

The average measurements are averages taken over the `std` and `mean` measurements from the original data set, averaging over the data grouped by `Subject` and `Activity`. These measurement variables are named as follows: 

    Measurement.[Coordinate.]Domain.Statistic
    
"Measurement" is the particular type of sensor measurement, optionally followed by a coordinate ("X", "Y", or "Z") for vector measurements. 
"Domain" is "Time" or "Freq" for statistics that are calculated in the time-domain or the frequency (fast-fourier-transform) domain.
"Statistic" is "Mean" or "StdDev" for the average or the standard deviation of the underlying raw data. 

These names are directly derived from the feature names described in the "features_info.txt" and enumerated in the "features.txt" files of the original data set. 

See the ReadMe.md file for a detailed description of the steps used to derive the resulting data set from the raw data.

### Variables

Variable | Description | Type | Values
---------|-------------|------|--------
Subject  | Subject ID  | factor | `Subject_1`, `Subject_2`, ..., `Subject_30`
Activity | Activity name | factor | `Laying`, `Sitting`, `Standing`, `Walking`, `Walking_Downstairs`, `Walking_Upstairs`
BodyAcc.X.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Y.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Z.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.X.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Y.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Z.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.X.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.Y.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.Z.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.X.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.Y.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAcc.Z.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.X.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Y.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Z.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.X.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Y.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Z.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.X.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Y.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Z.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.X.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Y.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Z.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.X.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.Y.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.Z.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.X.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.Y.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerk.Z.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccMag.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccMag.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAccMag.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
GravityAccMag.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerkMag.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerkMag.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroMag.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroMag.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerkMag.Time.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerkMag.Time.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.X.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Y.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Z.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.X.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Y.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAcc.Z.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.X.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Y.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Z.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.X.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Y.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerk.Z.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.X.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Y.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Z.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.X.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Y.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyro.Z.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccMag.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccMag.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerkMag.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyAccJerkMag.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroMag.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroMag.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerkMag.Freq.Mean | Average Measurement | numeric | normalized and bounded within [-1,1]
BodyGyroJerkMag.Freq.StdDev | Average Measurement | numeric | normalized and bounded within [-1,1]

