#' @title Labelset for Corals
#'
#' @description A \code{data_frame} that can be used with the cleaning vignette
#'     to rename columns in quadrat data and add functional group data, to
#'     to produce easy to interpret data frames. The short names were used to
#'     identify substrate using [CoralNet](https://coralnet.ucsd.edu/) and are
#'     included in the output from CoralNet.
#'
#' @format A \code{data_frame} with 3 columns, which are:
#' \describe{
#' \item{short_name}{The short name ID used to annotate the photo quadrats}
#' \item{full_name}{The long name and definition for each short name ID}
#' \item{functional_group}{The functional group for each ID}
#' }
"coral_labelset"
