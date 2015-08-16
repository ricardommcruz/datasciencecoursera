corr <- function(directory, threshold = 0) {
    
    buffer <- numeric()
    
    # Iterate over each file
    for(i in 1:332) {
        # read the file
        filename <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
        data <- read.csv(filename)
        
        tmp <- complete(directory, i)
        
        if(tmp$nobs > threshold)
            buffer <- c(buffer,cor(data$sulfate,data$nitrate,use="pairwise.complete.obs"))
        
        rm(data)
    }
    
    # just return the data
    buffer
}