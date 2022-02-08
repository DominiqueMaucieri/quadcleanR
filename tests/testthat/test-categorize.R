#create data set for test
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Notes)


test_binary <- categorize(data = coral_cover, column = "Transect", values = "Shallow", name = "Shallow", binary = TRUE)
expect_equal(colnames(test_binary[3]), "Shallow")
expect_equal(levels(test_binary$Shallow), c("No", "Yes"))

test_cat <- categorize(data = coral_cover, column = "Transect", values = c("Shallow", "Deep"), name = "Depth", binary = FALSE, categories = c("S", "D"))
expect_equal(colnames(test_cat[3]), "Depth")
expect_equal(levels(test_cat$Depth), c("D", "S"))
