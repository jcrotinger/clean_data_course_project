## Getting and Cleaning Data - Course Project

### Table of Contents

* [Goal][#goal]
* [Repository Contents][#repository-contents]
* [Dependencies][#dependencies]
* [References][#references]

### Goal

Our course project is to demonstrate the steps of creating a ["tidy data set"][tidy-data] using the [Human Activity Recognition Using Smartphones Dataset][har-project] (data downloadable [here][har-dataset]). 

[har-project]: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[har-dataset]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
[tidy-data]: http://vita.had.co.nz/papers/tidy-data.pdf

The deliverables require R script, `run_analysis.R` that, quoting from the [project description][course-project]:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

[course-project]: https://class.coursera.org/getdata-014/human_grading/view/courses/973501/assessments/3/submissions

### Repository Contents

The repository includes the following files:

* `run_analysis.R`: This script runs the analysis and creates a tidy data set `tidy_data.txt` containing the results. The lion's share of the work is done by a function `loadData` that encapsulates the steps to turn the raw data into a tall data-set that is then manipulated with `dplyr` to create the tidy dataset. This avoids duplication of code for the "test" and "train" data. 
* `loadActivityLabels.R`: Defines a function that is used to load and clean the activity factor labels.
* `filterFeatures.R`: Defines the `filterFeaturs` function that loads the feature list from the raw data and returns a list containing the tidy variable names and a vector of classes that is used to filter the columns when they are loaded. 
* `normalizeName.R`: Defines the `normalizeName` function that is used in `filterFeatures` to process the raw variable names into R-friendly variable names.

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
* [David's personal course project FAQ](https://class.coursera.org/getdata-014/forum/thread?thread_id=30) by [David Hood](https://class.coursera.org/getdata-014/forum/profile?user_id=134866)

