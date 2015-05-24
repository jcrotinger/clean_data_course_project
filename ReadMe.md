## Getting and Cleaning Data - Course Project


### Contents

The repository includes the following files:

* `run_analysis.R`: This script runs the analysis and creates a tidy data set `tidy_data.txt` containing the results. 
* `loadActivityLabels.R`: Defines a function that is used to load and clean the activity factor labels.
* `filterFeatures.R`: Defines the `filterFeaturs` function that loads the feature list from the raw data and returns a list containing the tidy variable names and a vector of classes that is used to filter the columns when they are loaded. 
* `normalizeName.R`: Defines the `normalizeName` function that is used in `filterFeatures` to process the raw variable names into R-friendly variable names.

### Dependencies

* [`dplyr`](http://cran.r-project.org/web/packages/dplyr/index.html)
* [`Hmisc`](http://cran.r-project.org/web/packages/Hmisc/index.html)
* [`stringr`](http://cran.r-project.org/web/packages/stringr/index.html)

### References

* [How to share data with a statistician](https://github.com/jtleek/datasharing/blob/master/README.md) by [Jeff Leek](http://jtleek.com).
* [A tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf) by [Hadley Wickham](http://had.co.nz/)
* [David's personal course project FAQ](https://class.coursera.org/getdata-014/forum/thread?thread_id=30) by [David Hood](https://class.coursera.org/getdata-014/forum/profile?user_id=134866)

