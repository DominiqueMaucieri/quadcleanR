## code to prepare `DATASET` dataset goes here

library(here)

softcoral_annotations <- read.csv(here::here("data-raw", "softcoral_annotations.csv"))

usethis::use_data(softcoral_annotations, overwrite = TRUE)


softcoral_LQuads <- read.csv(here::here("data-raw", "softcoral_large_quad.csv"))

usethis::use_data(softcoral_LQuads, overwrite = TRUE)


softcoral_SQuads <- read.csv(here::here("data-raw", "softcoral_small_quad.csv"))

usethis::use_data(softcoral_SQuads, overwrite = TRUE)
