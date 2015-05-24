## File: loadActivityLabels.R
## Author: James A. Crotinger [JAC]
## Date: 22-May-15

loadActivityLabels <- function(root.path) {
    ## Load the activity labels, clean up the names, and return the results.
    ##
    ## Input names are UPPER_CASE_SEPARATED_BY_UNDERSCORES.
    ## Convert to Pseudo_Camel_Case_With_Underscores for readability.
    ## (I didn't use "." as these aren't row or column labels, so they will
    ## always be quoted, unlike column labels.)
    ##
    ## Args:
    ##      root.path: Root data directory containing the
    ##      "activity_labels.txt" file
    ##
    ## Returns:
    ##      The normalized list of activity labels.

    activity.path <- paste(root.path, "activity_labels.txt", sep="/")
    activity.labels <- read.table(activity.path, stringsAsFactors=FALSE)

    fixActivityName <- function(x) {
        x <- tolower(x)
        capit <- function(x) paste0(toupper(substring(x, 1, 1)), substring(x, 2, nchar(x)))
        sapply(strsplit(x, "_"), function(x) paste(capit(x), collapse='_'))
    }

    sapply(activity.labels[,2], fixActivityName, USE.NAMES=F)
}
