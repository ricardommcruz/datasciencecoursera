library(dplyr)

# 1. Read data
data <- readRDS("summarySCC_PM25.rds")

# 2. Filter rows, group by year and summarise for a nice graph
data <- data %>% filter(fips == "24510") %>% group_by(Year=year) %>% summarise(Emissions=sum(Emissions))

# 3. Open the png graphics device
png(filename = "plot2.png")

# 4. Draw Plot
plot(data, main='Emissions of PM2.5 (Baltimore City, MD)', type='l')

# 5. Close the graphics device
dev.off()