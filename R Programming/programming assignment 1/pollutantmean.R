pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    buffer <- c()
    
    # Iterate over each file
    for(i in id) {
        # read the file
        filename <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
        data <- read.csv(filename)
        
        # extract the relevant column of data from the data frame as a vector
        col = data[[pollutant]]
        
        # concatenate the new values with the existing ones removing NAs in the process
        buffer <- c(buffer,col[!is.na(col)])
        
        rm(data)
    }
    
    # at this point buffer contains all relevant measurements for the desired pollutant
    # let's just take the mean (the NA values have already been eliminated so no need to
    # pass the na.rm parameter
    mean(buffer)
}