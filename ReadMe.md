## Getting and Cleaning Data - Course Project

### TL;DR

1. Check out this repository. 
2. Download the raw dataset from [here][har-project] and unzip into working copy of the repository.
3. From the working copy of the repository, run R. From R...
4. Run the analysis: `source('run_analysis.R')`
5. View the data: `View(tidy.data)`
6. Load the `tidy_data.txt` file: ` test <- read.table("tidy_data.txt", header=TRUE)`
7. View the data: `View(test)`

### Table of Contents

* [Goal](#goal)
* [Repository Contents](#repository-contents)
* [Loading the Data](#loading-the-data)
* [Dependencies](#dependencies)
* [References](#references)

### Goal

Our course project is to demonstrate the steps of creating a "tidy data set" (as per [Hadley Wickham's paper][tidy-data]) using the [Human Activity Recognition Using Smartphones Dataset][har-project] (data downloadable [here][har-dataset]). 

[har-project]: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[har-dataset]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[tidy-data]: http://vita.had.co.nz/papers/tidy-data.pdf

The project requires an R script, `run_analysis.R` that, quoting from [the project description][course-project]:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

[course-project]: https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions

### Repository Contents

The repository includes the following files:

* `run_analysis.R`: This script runs the analysis and creates a tidy data set `tidy_data.txt` containing the results. Details in [Steps below](#steps). 
* `loadActivityLabels.R`: Defines a function that is used to load and clean the activity factor labels.
* `filterFeatures.R`: Defines the `filterFeaturs` function that loads the feature list from the raw data and returns a list containing the tidy variable names and a vector of classes that is used to filter the columns when they are loaded. 
* `normalizeName.R`: Defines the `normalizeName` function that is used in `filterFeatures` to process the raw variable names into R-friendly variable names.

### Loading the Data

To load the data into R, place the `tidy_data.txt` file in R's working directory and execute:

    tidy.data <- read.table("tidy_data.txt", header=TRUE)

### Steps

The `run_analysis.R` script proceeds in several steps.

##### Activity Labels

`loadActivityLabels` is run to load the activities from the original data set's `activity_labels.txt` file. The original data are in upper-case, separated by underscores. These are transformed to pseudo-camel-case, with the understcores retained for readability. I didn't use "." for a seperator as these aren't row or column labels, so they will always be quoted, unlike column names. 

This step satisfies [Step 3](#goal).

##### Features

Next the set of variables of interest is calculated by `filterFeatures`. This function finds the features in the original data set that are "mean" or "std" statistics of the raw measurements. 

The original feature names are in the form:

    "([tf])(.*)-(mean|std)\\(\\)(-[XYZ])?"
    
These are converted to:

    MeasurementName.[Time|Freq][.(X|Y|Z)]?.[Mean|StdDev]

For example

    fBodyGyro-std()-X 
    
becomes

    BodyGyro.X.Freq.StdDev

Also, a few variables have "BodyBody", which appears to be a mistake and the duplicated "Body" is repaired.

`filterFeatures` returns the list of normalized variable names along with a character array that is used when loading the actual data to specify the `colClasses`. Filtering the data on load significantly sped up the load step and also reduces memory use. 

This step satisfies [Step 4](#goal).

##### Building the Data Frames

After the activity labels and features are loaded, the script uses the nested function `loadData` to load the training and test data into two dataframes, `train` and `test`. This is done by creating three dataframes:

* The `Subject` data, read from the appropriate "subject" file (e.g. `test/subject_test.txt`)
* The `Activity` data, read from the corresponding "y" file (e.g. `test/y_test.txt`)
* The measurement data, read from the corresponding "X" file (e.g. `test/X_test.txt`)

Care is taken to turn the `Subject` and `Activity` data into factor data. 

We use the filter supplied by `filterFeatures` to only load the "mean" and "std" data, as per [Step 2](#goal), and we take care to rename the columns with the tidy-data names.

Finally these dataframes are merged with `cbind` and returned. 

##### Merging and Averaging the data

Finally, as per [Step 1](#goal), we merge the `test` and `train` datasets. The resulting merged dataframe is "piped" to the grouping and averaging steps required by [Step 5](#goal). This is quite succinct using `dplyr`:

    tidy.data <-
        rbind(train, test) %>%
        group_by(Subject, Activity) %>%
        summarise_each(funs(mean))

`rbind` does the row-merge of the `train` and `test` datasets, `group_by` performs the required grouping, and `summarise_each` applies the specified function(s) to each variable in the resulting set. 

##### Writing the data

Finally we write the data to a space-delimited text file named `tidy_data.txt`:

    write.table(tidy.data, row.name=FALSE, file="tidy_data.txt")

### Dependencies

* [`dplyr`][dplyr]
* [`Hmisc`][hmisc]
* [`stringr`][stringr]

[dplyr]: http://cran.r-project.org/web/packages/dplyr/index.html
[hmisc]: http://cran.r-project.org/web/packages/Hmisc/index.html
[stringr]: http://cran.r-project.org/web/packages/stringr/index.html

### References

* [Getting and Cleaning Data Course Project][course-project]
* [How to share data with a statistician](https://github.com/jtleek/datasharing/blob/master/README.md) by [Jeff Leek](http://jtleek.com).
* [A tidy data set][tidy-data] by [Hadley Wickham](http://had.co.nz/)
* [David's personal course project FAQ](https://class.coursera.org/getdata-014/forum/thread?thread_id=30) by [David Hood][david-hood]
* [Tidy data and the Assignment](https://class.coursera.org/getdata-014/forum/thread?thread_id=31) by [David Hood][david-hood]

[david-hood]: https://class.coursera.org/getdata-014/forum/profile?user_id=134866
