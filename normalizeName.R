## File: normalizeName.R
## Author: James A. Crotinger [JAC]
## Date: 22-May-15

library(stringr)
library(Hmisc)

normalizeName <- function(name) {
    ## Computes the normalized name for a data-set variable.
    ##
    ## These are in the form (rough regexp - I'm not using it to parse):
    ##
    ##      "([tf])(.*)-(mean|std)\\(\\)(-[XYZ])?"
    ##
    ## These are converted to:
    ##
    ##      MeasurementName.[Time|Freq][.(X|Y|Z)]?.[Mean|StdDev]
    ##
    ## For example
    ##
    ##      fBodyGyro-std()-X becomes BodyGyro.X.Freq.StdDev
    ##
    ## A few variables have "BodyBody", which appears to be a mistake,
    ## so I clean these up as well.
    ##
    ## Parsing here is pretty brute-force and error checking is not complete.
    ##
    ## Args:
    ##    name: The variable name from the data set.
    ##
    ## Returns:
    ##    The normalized name.
    ##

    s <- strsplit(name, NULL)[[1]]
    n <- length(s)

    # Determine whether the variables are time / freq domain
    # and whether they are vector components.

    is.freq <- s[1] == 'f'
    if (!is.freq && s[1] != 't')
        stop("Invalid name - must start with 't' or 'f'")

    is.coord <- s[n] == 'X' || s[n] == 'Y' || s[n] == 'Z'
    coord <- if (is.coord) s[n] else NA

    new.end <- if (is.coord) { n - 5 } else { n - 3 }
    s <- s[1:new.end+1]

    # Determine whether these are means ["-mean()"] or
    # standard deviations ["-std()"]

    type.str <- paste(s[(new.end-3):new.end], collapse='')

    is.std = type.str == "-std"
    if (!is.std && type.str != "mean") stop("Invalid Heading")

    new.end = if (is.std) { new.end - 4 } else { new.end - 5 }
    s <- s[1:new.end]

    # Fix the names that have "BodyBody"
    s.str <- replace.substring.wild(paste(s, collapse=''), "BodyBody*", "Body*")

    # Assemble and return the results...
    if (is.coord)
        s.str <- paste(s.str, coord, sep='.')

    as.character(
        paste(s.str,
          {
              if (is.freq) "Freq" else "Time"
          },
          {
              if (is.std) "StdDev" else "Mean"
          },
          sep='.'))
}
