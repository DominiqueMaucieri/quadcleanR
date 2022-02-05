
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Notes)


exact_keep_row <- keep_rm(coral_cover, c("One") , "row", TRUE, TRUE, TRUE, "Sites")
expect_equal(nrow(exact_keep_row), as.integer(3))
expect_equal(length(levels(exact_keep_row$Sites)), as.integer(1))

exact_keep_col <- keep_rm(coral_cover, c("Acropora.sp", "Gardineroseris.sp",
                         "Psammocora.sp", "Leptastrea.sp") , "col", TRUE, TRUE, TRUE)
expect_equal(ncol(exact_keep_col), as.integer(4))

exact_rm_row <- keep_rm(coral_cover, c("Three") , "row", FALSE, FALSE, TRUE, "Sites")
expect_equal(nrow(exact_rm_row), as.integer(5))
expect_equal(length(levels(exact_rm_row$Sites)), as.integer(3))

exact_rm_col <- keep_rm(coral_cover, c("Notes") , "col", FALSE, FALSE, TRUE)
expect_equal(ncol(exact_rm_col), as.integer(6))
