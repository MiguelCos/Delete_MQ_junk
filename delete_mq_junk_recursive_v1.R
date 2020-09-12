## Script to delete junk files after MaxQuant search ----

library(stringr)

## set working directory ----

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Delete everything but the txt folder from the 'combinen' MQ output ----

folders <- list.dirs(getwd(), recursive = FALSE)

combinedf <- list.dirs(paste0(folders,"/combined"), recursive = FALSE)

files_comb <- list.files(combinedf)

comb2del <- files_comb[which(str_detect(files_comb, "txt", negate = TRUE))]

comb2del <- comb2del[which(str_detect(comb2del, "mqpar.xml", negate = TRUE))]

comb2del1 <- comb2del[which(str_detect(comb2del, "tables.pdf", negate = TRUE))]

comb2del_comb <- paste0(folders,"/combined/", comb2del1)

combdirs <- list.dirs(paste0(folders, "/combined"))

tokeep1 <- combdirs[str_which(combdirs, "combined$")]
tokeep2 <- combdirs[str_which(combdirs, "combined/txt$")]
tokeep <- c(tokeep1, tokeep2)

dir2remov <- combdirs[which(!combdirs %in% tokeep)]

unlink(dir2remov, recursive = TRUE)

file.remove(comb2del_comb)

## Delete temporary index folder ----

folders <- list.dirs(getwd(), recursive = FALSE)

files_temp <- list.files(folders)

raw_files <- files_temp[str_which(files_temp, ".raw$")]

raw_file_names <- str_remove(raw_files, ".raw$")

index_files <- files_temp[str_which(files_temp, ".index$")]

indexfolders <- list.dirs(folders)

todel_folders <- indexfolders[which(str_detect(indexfolders, "n0$") | str_detect(indexfolders, "p0$"))]

unlink(todel_folders, recursive = TRUE)
