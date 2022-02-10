
useable_obs <- function(data, unusable, max = FALSE, cutoff, print_max = FALSE, rm_unusable = TRUE){

  unusable_vector <- c(unusable)
  data[["unusable"]] <- "error"

  for (i in 1:nrow(data)) {
    data[["unusable"]][i] <- sum(data[i,colnames(data) %in% unusable_vector])

  }

  if(rm_unusable == TRUE){
    data <- data[!colnames(data) %in% unusable_vector]

  }
  if(rm_unusable == FALSE){warning('duplication exists in the data frame')}
  if(max == TRUE){
    data <- data[data[["unusable"]] <= cutoff,]

    if(print_max == TRUE){
      data_rm <- data[data[["unusable"]] > cutoff,]
      return(data)
      return(data_rm)

    }
    return(data)
  }
  if(max == FALSE){
    if(print_max == TRUE){warning('no max specified')}
    return(data)

  }
}

