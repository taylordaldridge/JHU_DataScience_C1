#Write a function that takes a directory of data files and a threshold for 
#complete cases and calculates the correlation between sulfate and nitrate 
#for monitor locations where the number of completely observed cases 
#(on all variables) is greater than the threshold. The function should 
#return a vector of correlations for the monitors that meet the threshold 
#requirement. If no monitors meet the threshold requirement, then the function 
#should return a numeric vector of length 0.


#check working directory
getwd()
directory<-setwd("/Users/a592006/Desktop/R/specdata")

#list files in directory
list.files()

#three variables
##Date in YYYY-MM-DD
##Sulfate levels
##Nitrate levels

corr<-function(directory,threshold=0){
        #create list of file names
        filesDir<-list.files(directory,full.names = TRUE)
        
        #create empty vector
        dat <- vector(mode = "numeric", length = 0)
        
        for(i in 1:length(filesDir)){
                #read in file
                temp<- read.csv(filesDir[i],header=TRUE)
                #delete NAs
                temp<-temp[complete.cases(temp),]
                #count the number of observations
                countsObs<-nrow(temp)
                #if the number of rows is greater than the threshold
                if(countsObs>threshold){
                        #for that file you find the correlation between nitrate and sulfate
                        #combine each correlation for each file in vector format using the concatenate function 
                        #since this is not a data frame we cannot use rbind or cbind
                        dat<-c(dat,cor(temp$nitrate,temp$sulfate))
                }
                
        }
        
        return(dat)
}

cr <- corr(directory, 150)
head(cr)
summary(cr)
cr <- corr(directory, 400)
head(cr)
summary(cr)
