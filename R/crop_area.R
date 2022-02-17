#' @title Crop quadrats based on area
#' @description Using the location of annotated points within quadrats and
#'     the size of the quadrat, crop quadrat data to a smaller area, while
#'     maintaining the spatial relationships between points.
#'
#' @param data A data frame containing annotations, in long format.
#' @param row The column name in data which contains the row location of
#'     the annotated points
#' @param column The column name in data which contains the column location of
#'     the annotated points
#' @param id The column name in data which contains the quadrat ID for
#'     the annotated points
#' @param dim A vector with length of 2, containing the proportion of the row and
#'     columns to crop. First element will be the proportion of the rows and the
#'     second will be the proportion of the columns.
#' @param obs_rm If obs_rm = FALSE, no quadrats will be removed from the returned
#'     data set. If obs_rm = TRUE, quadrats will be removed from the returned
#'     data set based on the number of annotated observations in the cropped area.
#' @param obs_range A vector with length of 2, specifying the min and max accepted
#'     number of annotated observations to retain in the data set.
#' @param res If res = TRUE if the dimensions of each quadrat are known. These must
#'     be the same units as the row and column locations. If dimensions are not
#'     known, specify res = FALSE, and the function will estimate the max dimensions
#'     based off the max row and column location for the annotated points.
#' @param res_dim_x The column name in data which contains the max column dimension
#'     for each quadrat.
#' @param res_dim_y The column name in data which contains the max row dimension
#'     for each quadrat.
#'
#' @return A data frame in long format with a subset of annotated points.
#' @export
#'
#' @examples
#'#Creating the data file
#'tags <- c("Clad", "Sinu", "Sarco", "Loph")
#'
#'site <- c(rep("Site1", times = 100),
#'          rep("Site2", times = 100),
#'          rep("Site3", times = 100),
#'          rep("Site4", times = 100))
#'row <- c(sample(x = c(1:2000), size = 100, replace = TRUE),
#'         sample(x = c(1:2000), size = 100, replace = TRUE),
#'         sample(x = c(1:2000), size = 100, replace = TRUE),
#'         sample(x = c(1:2000), size = 100, replace = TRUE))
#'column <- c(sample(x = c(1:2000), size = 100, replace = TRUE),
#'            sample(x = c(1:2000), size = 100, replace = TRUE),
#'            sample(x = c(1:2000), size = 100, replace = TRUE),
#'            sample(x = c(1:2000), size = 100, replace = TRUE))
#'label <- c(sample(x = tags, size = 100, replace = TRUE),
#'           sample(x = tags, size = 100, replace = TRUE),
#'           sample(x = tags, size = 100, replace = TRUE),
#'           sample(x = tags, size = 100, replace = TRUE))
#'coral_annotations <- data.frame(site, row, column, label)
#'
#'
#'par(mfrow = c(2, 2))
#'plot(x = coral_annotations$column[1:100], y = coral_annotations$row[1:100],
#'     ylab = "", xlab = "", main = "Site1")
#'plot(x = coral_annotations$column[101:200], y = coral_annotations$row[101:200],
#'     ylab = "", xlab = "", main = "Site2")
#'plot(x = coral_annotations$column[201:300], y = coral_annotations$row[201:300],
#'     ylab = "", xlab = "", main = "Site3")
#'plot(x = coral_annotations$column[301:400], y = coral_annotations$row[301:400],
#'     ylab = "", xlab = "", main = "Site4")
#'
#'crop_area_coral <- crop_area(data = coral_annotations, row = "row",
#'                             column = "column", id = "site", dim = c(0.5, 0.5))
#'
#'site_1 <- subset(crop_area_coral, site == "Site1")
#'site_2 <- subset(crop_area_coral, site == "Site2")
#'site_3 <- subset(crop_area_coral, site == "Site3")
#'site_4 <- subset(crop_area_coral, site == "Site4")
#'
#'plot(x = coral_annotations$column[1:100], y = coral_annotations$row[1:100],
#'     ylab = "", xlab = "", main = "Site1") +
#'  points(site_1$column, site_1$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*max(coral_annotations$column[1:100]),
#'                0.5*max(coral_annotations$column[1:100])),
#'         y = c(0, 0.5*max(coral_annotations$row[1:100]),
#'                0.5*max(coral_annotations$row[1:100]), 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[101:200], y = coral_annotations$row[101:200],
#'     ylab = "", xlab = "", main = "Site2") +
#'  points(site_2$column, site_2$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*max(coral_annotations$column[101:200]),
#'                0.5*max(coral_annotations$column[101:200])),
#'          y = c(0, 0.5*max(coral_annotations$row[101:200]),
#'                0.5*max(coral_annotations$row[101:200]), 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[201:300], y = coral_annotations$row[201:300],
#'     ylab = "", xlab = "", main = "Site3") +
#'  points(site_3$column, site_3$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*max(coral_annotations$column[201:300]),
#'                0.5*max(coral_annotations$column[201:300])),
#'          y = c(0, 0.5*max(coral_annotations$row[201:300]),
#'                0.5*max(coral_annotations$row[201:300]), 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[301:400], y = coral_annotations$row[301:400],
#'     ylab = "", xlab = "", main = "Site4") +
#'  points(site_4$column, site_4$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*max(coral_annotations$column[301:400]),
#'                0.5*max(coral_annotations$column[301:400])),
#'          y = c(0, 0.5*max(coral_annotations$row[301:400]),
#'                0.5*max(coral_annotations$row[301:400]), 0),
#'          border = "red",
#'          lwd = 2)
#'
#'coral_annotations$col_dim <- 2000
#'coral_annotations$row_dim <- 2000
#'
#'crop_area_coral_2 <- crop_area(data = coral_annotations, row = "row",
#'                               column = "column", id = "site", dim = c(0.5, 0.5),
#'                               res = TRUE, res_dim_x = "col_dim", res_dim_y = "row_dim")
#'
#'site_1_2 <- subset(crop_area_coral_2, site == "Site1")
#'site_2_2 <- subset(crop_area_coral_2, site == "Site2")
#'site_3_2 <- subset(crop_area_coral_2, site == "Site3")
#'site_4_2 <- subset(crop_area_coral_2, site == "Site4")
#'
#'
#'plot(x = coral_annotations$column[1:100], y = coral_annotations$row[1:100],
#'     ylab = "", xlab = "", main = "Site1") +
#'  points(site_1_2$column, site_1_2$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*2000, 0.5*2000),
#'          y = c(0, 0.5*2000, 0.5*2000, 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[101:200], y = coral_annotations$row[101:200],
#'     ylab = "", xlab = "", main = "Site2") +
#'  points(site_2_2$column, site_2_2$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*2000, 0.5*2000),
#'          y = c(0, 0.5*2000, 0.5*2000, 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[201:300], y = coral_annotations$row[201:300],
#'     ylab = "", xlab = "", main = "Site3") +
#'  points(site_3_2$column, site_3_2$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*2000, 0.5*2000),
#'          y = c(0, 0.5*2000, 0.5*2000, 0),
#'          border = "red",
#'          lwd = 2)
#'plot(x = coral_annotations$column[301:400], y = coral_annotations$row[301:400],
#'     ylab = "", xlab = "", main = "Site4") +
#'  points(site_4_2$column, site_4_2$row, col = "red") +
#'  polygon(x = c(0, 0, 0.5*2000, 0.5*2000),
#'          y = c(0, 0.5*2000, 0.5*2000, 0),
#'          border = "red",
#'          lwd = 2)
#'
#'
crop_area <- function(data, row, column, id, dim, obs_rm = FALSE, obs_range, res = FALSE, res_dim_x, res_dim_y){

  if(res == FALSE){
    replicates <- unique(data[[id]])

    for(i in 1:length(replicates)){
      data_i_raw <- data[data[[id]] == replicates[i],]
      rowmax_crop_i <- dim[1]*max(data_i_raw[[row]])
      colmax_crop_i <- dim[2]*max(data_i_raw[[column]])
      data_i <- data_i_raw[(data_i_raw[[row]] <= rowmax_crop_i) &
                             (data_i_raw[[column]] <= colmax_crop_i),]
      data_i[["obs"]] <- nrow(data_i)

      if(obs_rm == TRUE){
        data_i <- data_i[(data_i[["obs"]] >= obs_range[1]) &
                           (data_i[["obs"]] <= obs_range[2]),]

      }
      if(i == 1){
        data_crop <- data_i

      }
      if(i != 1){
        data_crop <- rbind(data_crop, data_i)

      }
    }
  }
  if(res == TRUE){
    replicates <- unique(data[[id]])

    for(i in 1:length(replicates)){
      data_i_raw <- data[data[[id]] == replicates[i],]
      rowmax_crop_i <- dim[1]*data_i_raw[[res_dim_x]][1]
      colmax_crop_i <- dim[2]*data_i_raw[[res_dim_y]][1]
      data_i <- data_i_raw[(data_i_raw[[row]] <= rowmax_crop_i) &
                             (data_i_raw[[column]] <= colmax_crop_i),]
      data_i[["obs"]] <- nrow(data_i)

      if(obs_rm == TRUE){
        data_i <- data_i[(data_i[["obs"]] >= obs_range[1]) &
                           (data_i[["obs"]] <= obs_range[2]),]

      }
      if(i == 1){
        data_crop <- data_i

      }
      if(i != 1){
        data_crop <- rbind(data_crop, data_i)

      }
    }
  }

  rownames(data_crop) <- NULL
  return(data_crop)

}
