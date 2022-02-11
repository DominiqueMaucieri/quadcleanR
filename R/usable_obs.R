
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

