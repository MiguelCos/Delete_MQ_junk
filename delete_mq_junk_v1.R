## Script to delete junk files after MaxQuant search ----
## Miguel Cosenza 07 - Sep - 2020 ----

## USAGE: 
# Copy this script and paste it in the same folder where you stored your 'combined' folder from MaxQuant and/or the temporary index files.
# Execute the script.
# The script would delete every folder and file within the combined folder that is not the 'txt' folder containing the sumarized results or an mqpar file.
# The script would delete all the 'n0' and 'p0' folders generated for each raw and index file used for search.

# NOTE OF CAUTION: THE FILES DELETED WITH THE SCRIPT ARE NOT RECOVERABLE (These will NOT be sent to the Recible Bin)

library(stringr)

## set working directory ----

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Delete everything but the txt folder from the 'combined' MQ output ----

files_comb <- list.files(paste0(getwd(),"/combined"))

comb2del <- files_comb[which(str_detect(files_comb, "txt", negate = TRUE))]

comb2del <- comb2del[which(str_detect(comb2del, "mqpar.xml", negate = TRUE))]

comb2del_comb <- paste0(getwd(),"/combined/", comb2del)

combdirs <- list.dirs(paste0(getwd(), "/combined"))

tokeep1 <- combdirs[str_which(combdirs, "combined$")]
tokeep2 <- combdirs[str_which(combdirs, "combined/txt$")]
tokeep <- c(tokeep1, tokeep2)

dir2remov <- combdirs[which(!combdirs %in% tokeep)]

unlink(dir2remov, recursive = TRUE)

file.remove(comb2del_comb)

## Delete temporary index folder ----

files_temp <- list.files(getwd())

index_files <- files_temp[str_which(files_temp, ".index$")]

folders <- list.dirs(getwd())

todel_folders <- folders[which(str_detect(folders, "n0$") | str_detect(folders, "p0$"))]

unlink(todel_folders, recursive = TRUE)
