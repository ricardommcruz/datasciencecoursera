complete <- function(directory, id = 1:332) {
    
    # create two vectors which will then be joined in a data frame
    ids  <- integer()
    nobs <- integer()
    
    # Iterate over each file
    for(i in id) {
        # read the file
        filename <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
        data <- read.csv(filename)
        
        tmp <- is.na(data$sulfate)|is.na(data$nitrate)
        
        ids <- c(ids,i)
        nobs <- c(nobs,length(which(tmp==FALSE)))
        
        rm(data)
    }
    
    # just return the data
    data.frame(id=ids,nobs)
}