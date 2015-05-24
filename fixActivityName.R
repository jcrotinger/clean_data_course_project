fixActivityName <- function(x) {
    x <- tolower(x)
    capit <- function(x) paste0(toupper(substring(x, 1, 1)), substring(x, 2, nchar(x)))
    sapply(strsplit(x, "_"), function(x) paste(capit(x), collapse='_'))
}
