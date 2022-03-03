
#' @title Extract useable observations.
#' @description Sum columns containing unuseable identified points and remove
#'     rows that contain more than the specified cutoff of unuseable points.
#'
#' @param data A data frame in wide format.
#' @param unuseable A vector of column names using unuseable identified points.
#' @param max If max = FALSE, no threshold will be examined. If max = TRUE, a
#'     threshold cutoff needs to be provided where rows containing more than the
#'     cutoff will be removed from the data frame.
#' @param cutoff The threshold number where rows containing more unuseable observations
#'     than the cutoff will be removed from the data frame.
#' @param print_max If print_max = TRUE, the data frame returned will be the
#'     rows containing more unuseable observations than the cutoff. If print_max = FALSE
#'     the data frame returned will be the rows containing equal to or less unuseable
#'     observations than the cutoff.
#' @param rm_unuseable If rm_unuseable = TRUE, the columns named in the unuseable
#'     vector will be removed from the data frame. These columns will not be
#'     removed if rm_unuseable = FALSE, though duplicate data will remain.
#'
#' @return A data frame of containing summed unuseable points. Data frame can be
#'     specified if it returns data above or below a threshold of unuseable points.
#' @export
#'
#' @examples
#' #create data set for example
#' Sites <- as.factor(c("One", "One", "Two", "Two", "Three", "Three"))
#' Transect <- as.factor(c("1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow",
#'     "1-Shallow", "2-Shallow"))
#' Acropora.sp <- c(1, 2, 3, 4, 5, 6)
#' Gardineroseris.sp <- c(6, 1, 2, 3, 4, 5)
#' Psammocora.sp <- c(5, 6, 1, 2, 3, 4)
#' Leptastrea.sp <- c(4, 5, 6, 1, 2, 3)
#' Blurry <- c(3, 4, 5, 6, 1, 2)
#' Unk <- c(2, 3, 4, 5, 6, 1)
#' coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
#'                           Psammocora.sp, Leptastrea.sp, Blurry, Unk)
#'
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"))
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), print_max = TRUE)
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), rm_unuseable = FALSE)
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8)
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8, print_max = TRUE)


useable_obs <- function(data, unuseable, max = FALSE, cutoff, print_max = FALSE, rm_unuseable = TRUE){

  unuseable_vector <- c(unuseable)
  data[["unuseable"]] <- "error"

  data$unuseable <- rowSums(data[,colnames(data) %in% unuseable_vector])

  if(rm_unuseable == TRUE){
    data <- data[!colnames(data) %in% unuseable_vector]

  }
  if(rm_unuseable == FALSE){warning('duplication exists in the data frame')}
  if(max == TRUE){
    if(print_max == TRUE){
      data_rm <- data[data$unuseable > cutoff,]
      rownames(data_rm) <- NULL
      return(data_rm)

    }
    if(print_max == FALSE){
      data <- data[data$unuseable <= cutoff,]
      rownames(data) <- NULL
      return(data)

    }
  }
  if(max == FALSE){
    if(print_max == TRUE){warning('no max specified')}
    return(data)

  }
}

