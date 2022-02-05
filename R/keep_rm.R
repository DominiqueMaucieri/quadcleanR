#' @title Keep or remove from data frame
#' @description Using a character, or part of character select aspects of the data
#'     frame to either keep or remove. Aspects of the data frame include rows or
#'     columns containing or not containing the specified characters.
#'
#' @param data The data frame.
#' @param values A vector containing the characters or parts of characters to base
#'    selection off of.
#' @param select If `row`, rows containing the `values` will be selected for either
#'    being kept, or being removed, as specified by `keep`. If `col`, columns with
#'    names containing the `values` will either be kept or removed, as specified
#'    by `keep`.
#' @param keep If keep == TRUE the presence of the `values` will cause the
#'    selected rows or columns to be kept. If keep == FAUSE the presence of
#'    the `values` will cause the selected rows or columns to be removed.
#' @param drop_levels If drop_levels == TRUE, factor levels that have been
#'    removed will be dropped.
#' @param exact If exact == TRUE only exact matches will be selected. If exact
#'    == FALSE matches will be selected if they contain the characters in the
#'    `values` vector.
#' @param colname If `select` == "row", colname will specify the column to
#'    select rows from.
#'
#' @return a data frame containing new selection of data.
#' @export
#'
#' @examples
#'# create data frame
#'Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
#'Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
#'Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
#'Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
#'Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
#'Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
#'Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
#'coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
#'                          Psammocora.sp, Leptastrea.sp, Notes)
#'
#'#Removing Notes column
#'keep_rm(coral_cover, c("Notes") , "col", FALSE, FALSE, TRUE)
#'
#'#Selecting site One and dropping extra levels
#'Site_One <- keep_rm(coral_cover, c("One") , "row", TRUE, TRUE, TRUE, "Sites")
#'levels(Site_One$Sites)

keep_rm <- function(data, values, select, keep = TRUE, drop_levels = TRUE, exact = TRUE, colname){

  if(exact == TRUE){
    if(keep == TRUE){
      if(select == "row"){
        data_keep <- data[data[[colname]] %in% values,]
        if(drop_levels == TRUE) data_keep <- droplevels(data_keep)

      }
      if(select == "col"){
        data_keep <- data[,values]
        if(drop_levels == TRUE) data_keep <- droplevels(data_keep)

      }
      return(data_keep)
    }

    if(keep == FALSE){
      if(select == "row"){
        data_rm <- data[!data[[colname]] %in% values,]
        if(drop_levels == TRUE) data_rm <- droplevels(data_rm)

      }
      if(select == "col"){
        keep_names <- colnames(data)[!colnames(data) %in% values]
        data_rm <- data[,keep_names]
        if(drop_levels == TRUE) data_rm <- droplevels(data_rm)

      }
      return(data_rm)
    }
  }

  if(exact == FALSE){}

}
