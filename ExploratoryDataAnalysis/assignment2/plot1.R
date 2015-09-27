library(dplyr)

# 1. Read data
data <- readRDS("summarySCC_PM25.rds")
sc <- readRDS("Source_Classification_Code.rds")

# 2. Find the SCC codes for sector Totals (otherwise we will double count)
sc <- sc %>% filter(SCC.Level.Four=='Total')

# 3. Filter rows, group by year and summarise for a nice graph
data <- data %>% filter(SCC %in% sc$SCC) %>% group_by(Year=year) %>% summarise(Emissions=(sum(Emissions)/1000))

# 4. Open the png graphics device
png(filename = "plot1.png")

# 5. Draw Plot
plot(data, main='Emissions of PM2.5 (whole of United States)',
           ylab="Emissions (000's)",
           type='l')

# 6. Close the graphics device
dev.off()