## File: filterFeatures.R
## Author: James A. Crotinger [JAC]
## Date: 22-May-15

source("normalizeName.R")

filterFeatures <- function(root.path) {
    ## Load the "features.txt" data and compute the desired columns headings
    ## along with the column filter for the data.table call.
    ##
    ## The desired headings are those with "-(mean|std)" in their names.
    ##
    ## Args:
    ##      root.path: The root path for the data set.
    ##
    ## Returns:
    ##      A list of heading names and a vector of character strings that
    ##      serves as a colClasses mask when loading the data table.

    features.path <- paste(root.path, "features.txt", sep="/")

    features <- read.table(features.path, stringsAsFactors=FALSE)
    columns <- grep(".*-(mean|std)\\(\\).*$", features$V2)

    headings <- sapply(features[columns,2], normalizeName, USE.NAMES=F)

    ncols <- nrow(features)

    filter <- logical(ncols)
    filter[columns] = TRUE

    classes <- rep("numeric", ncols)
    classes[!filter] = "NULL"         ## These will NOT be loaded

    list(headings=headings, classes=classes)
}
