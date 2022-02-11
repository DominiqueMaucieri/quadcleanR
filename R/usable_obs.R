
#' Title
#'
#' @param data A data frame in wide format.
#' @param unusable A vector of column names using unusable identified points.
#' @param max If max = FALSE, no threshold will be examined. If max = TRUE, a
#'     threshold cutoff needs to be provided where rows containing more than the
#'     cutoff will be removed from the data frame.
#' @param cutoff The threshold number where rows containing more unusable observations
#'     than the cutoff will be removed from the data frame.
#' @param print_max If print_max = TRUE, the data frame returned will be the
#'     rows containing more unusable observations than the cutoff. If print_max = FALSE
#'     the data frame returned will be the rows containing equal to or less unusable
#'     observations than the cutoff.
#' @param rm_unusable If rm_unusable = TRUE, the columns named in the unusable
#'     vector will be removed from the data frame. These columns will not be
#'     removed if rm_unusable = FALSE, though duplicate data will remain.
#'
#' @return A data frame of containing summed unusable points. Data frame can be
#'     specified if it returns data above or below a threshold of unusable points.
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
#' useable_obs(coral_cover, c("Blurry", "Unk"), rm_unusable = FALSE)
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8)
#'
#' useable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8, print_max = TRUE)


useable_obs <- function(data, unusable, max = FALSE, cutoff, print_max = FALSE, rm_unusable = TRUE){

  unusable_vector <- c(unusable)
  data[["unusable"]] <- "error"

  data$unusable <- rowSums(data[,colnames(data) %in% unusable_vector])

  if(rm_unusable == TRUE){
    data <- data[!colnames(data) %in% unusable_vector]

  }
  if(rm_unusable == FALSE){warning('duplication exists in the data frame')}
  if(max == TRUE){
    if(print_max == TRUE){
      data_rm <- data[data$unusable > cutoff,]
      rownames(data_rm) <- NULL
      return(data_rm)

    }
    if(print_max == FALSE){
      data <- data[data$unusable <= cutoff,]
      rownames(data) <- NULL
      return(data)

    }
  }
  if(max == FALSE){
    if(print_max == TRUE){warning('no max specified')}
    return(data)

  }
}

