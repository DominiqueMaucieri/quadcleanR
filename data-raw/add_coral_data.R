
library(here)

softcoral_annotations <- read.csv(here::here("data-raw", "softcoral_annotations.csv"))

usethis::use_data(softcoral_annotations, overwrite = TRUE,
                  compress = "xz")


softcoral_LQuads <- read.csv(here::here("data-raw", "softcoral_large_quad.csv"))

usethis::use_data(softcoral_LQuads, overwrite = TRUE,
                  compress = "xz")


softcoral_SQuads <- read.csv(here::here("data-raw", "softcoral_small_quad.csv"))

usethis::use_data(softcoral_SQuads, overwrite = TRUE,
                  compress = "xz")


coral_labelset <- read.csv(here::here("data-raw", "coral_labelset.csv"))

usethis::use_data(coral_labelset, overwrite = TRUE,
                  compress = "xz")


environmental_data <- read.csv(here::here("data-raw", "environmental_data.csv"))

usethis::use_data(environmental_data, overwrite = TRUE,
                  compress = "xz")

final_cleaned <- read.csv(here::here("data-raw", "final_cleaned.csv"))

usethis::use_data(final_cleaned, overwrite = TRUE,
                  compress = "xz")

