## Code Book
### Data Set Code Book: "Getting and Cleaning Data" Course Project

### Raw Data

This project works with the [Human Activity Recognition Using Smartphones Dataset][har-project] (data downloadable [here][har-dataset]). The raw data was a given and the details of it's capture are beyond the scope of this project.

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

* TODO: Add link to raw data
* TODO: Add references to tidy data documentation
* TODO: Add description of data in output file
* TODO: Add description of steps to get from raw data to output file

### Raw Data

For this project, I have taken the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), analyzed the structure of the data, and created a script, `run_analysis.R`, that processes the dataset and outputs a tidy dataset described below. 

