# create test data
year <- sample(x = seq(from = 2000, to = 2020, by = 1), 1000, replace = TRUE)
site <- sample(x = c("site1", "site2", "site3", "site4", "site5"), 1000, replace = TRUE)
transect <- sample(x = c("transect1", "transect2", "transect3", "transect4"), 1000, replace = TRUE)
species <- sample(x = c("Acropora", "Gardineroseris", "Psammocora", "Leptastrea"), 1000, replace = TRUE)
cover <- sample(x = seq(from = 0, to = 1, by = 0.01), 1000, replace = TRUE)

coral <- data.frame(year, site, transect, species, cover)

# visualize_app(data = coral, independent = colnames(coral[,1:4]), dependent = "cover")
