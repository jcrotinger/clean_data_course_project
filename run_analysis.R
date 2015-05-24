## File: run_analysis.R
## Author: James A. Crotinger [JAC]
## Date: 22-May-15

## R Script for the Coursera "Getting and Cleaning Data" Course Project.
##
## Load the data from the "UCI HAR Dataset" and compute a single tidy data set
## containing the mean and standard-deviation variables from test and
## training data sets. Write the result to the file "tidy_data.txt".
##
## See the CodeBook.md document for a detailed description of the data
## manipulations done by this script.
source("loadActivityLabels.R")
source("filterFeatures.R")

library(dplyr)

## The UCI HAR Dataset should be in the working directory when the
## script is run. If it is elsewhere, modify this path.

dataroot <- "UCI HAR Dataset"

## Load the activity labels and the filtered (and cleaned) features.

activity.labels <- loadActivityLabels(dataroot)
features        <- filterFeatures(dataroot)

loadData <- function(root.path, dataset) {
    ## Load the data for the "test" or "train" data set and return that
    ## portion of the "tidy" data set as a data frame.

    if (!(dataset %in% c("test", "train"))) {
        msg <- "dataset name must be \"test\" or \"train\", not \""
        stop(paste0(msg, dataset, "\""))
    }

    dir <- paste(root.path, dataset, sep="/")

    ## Read the appropriate "activity" file, e.g. test/y_test.txt,
    ## and convert the variable to a factor.

    activity.path     <- paste(dir, paste0("y_", dataset, ".txt"), sep="/")
    activity          <- read.table(activity.path, col.names="Activity")
    activity$Activity <- factor(activity$Activity, levels=1:6, labels=activity.labels)

    ## Load the "subject" file, e.g. test/subject_test.txt, as a data frame.
    ## Turn "Subject" into a factor with labels "Subject_N", N = 1:30.

    subj.path <- paste(dir, paste0("subject_", dataset, ".txt"), sep="/")
    subject   <- read.table(subj.path, col.names="Subject")

    subject.labels <- mapply(
        function(s,i){ paste0(s,i) },
        rep("Subject_", 30),
        1:30,
        USE.NAMES=FALSE
    )

    subject$Subject <- factor(
        subject$Subject,
        levels=1:30,
        labels=subject.labels)

    ## Load the measurement data, e.g. test/X_test.txt, using the
    ## features$classes to filter the columns to only those needed.
    ## Set the headings for the results our tidy headings.

    data.path   <- paste(dir, paste("X_", dataset, ".txt", sep=""), sep="/")
    data        <- read.table(data.path, colClasses=features$classes)
    names(data) <- features$headings

    ## Finally combine the subject, activity and data into a single
    ## data frame and return it.

    cbind(subject, activity, data)
}

## Load the train and test sets...

test  <- loadData(dataroot, "test")
train <- loadData(dataroot, "train")

## ... Then merge with bind and feed the results to the dplyr
## group_by and summarise_each to compute the mean of each column
## over the data in each of these groups

tidy.data <-
    rbind(train, test) %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(mean))

## Write the results to "tidy_data.txt"

write.table(tidy.data, row.name=FALSE, file="tidy_data.txt")

rm(test, train)

