#check working directory
getwd()
directory<-setwd("/Users/a592006/Desktop/R/specdata")

#list files in directory
list.files()

#three variables
        ##Date in YYYY-MM-DD
        ##Sulfate levels
        ##Nitrate levels

pollutantmean <- function(directory, pollutant, id = 1:332) {
        
        files_full <- list.files(directory, full.names = TRUE) 
        
        dat <- data.frame()
        
        for (i in id) {
                dat <- rbind(dat, read.csv(files_full[i]))
        }
        
        mean(dat[, pollutant], na.rm = TRUE)
}

pollutantmean(directory, "sulfate", 1:10)
pollutantmean(directory, "nitrate", 70:72)
pollutantmean(directory, "nitrate", 23)
