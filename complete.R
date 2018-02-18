#Write a function that reads a directory full of files and reports the 
#number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of 
#the file and the second column is the number of complete cases. 

#check working directory
getwd()
directory<-setwd("/Users/a592006/Desktop/R/specdata")

#list files in directory
list.files()

#three variables
##Date in YYYY-MM-DD
##Sulfate levels
##Nitrate levels

complete <- function(directory,id=1:332){
        
        #create a list of files
        filesCom<-list.files(directory,full.names = TRUE)
        #create an empty data frame
        dat <- data.frame()
        
        for(i in id){
                #read in the file
                temp<- read.csv(filesCom[i],header=TRUE)
                #delete rows that do not have complete cases
                temp<-na.omit(temp)
                
                #count all of the rows with complete cases
                CountRows<-nrow(temp)
                
                #enumerate the complete cases by index
                dat<-rbind(dat,data.frame(i,CountRows))
                
        }
        return(dat)
}

complete(directory, 1)
complete(directory, c(2, 4, 8, 10, 12))
complete(directory, 30:25)
complete(directory, 3)
