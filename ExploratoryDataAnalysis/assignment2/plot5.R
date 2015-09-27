library(dplyr)
library(ggplot2)

# 1. Read data
data <- readRDS("summarySCC_PM25.rds")
sc <- readRDS("Source_Classification_Code.rds")

# 2. Transform/convert
#
# The interpertatoin of this question only the on-road measurements
# arising from terretrial motor vehicles is used.
#
sc <- sc %>% filter(grepl("Mobile - On-Road", sc$EI.Sector))

data <- data %>% filter(fips == "24510" & SCC %in% sc$SCC) %>% group_by(Year=year) %>% summarise(Emissions=sum(Emissions))

# 3. Draw Plot
qplot(Year, Emissions, data=data, geom="line",
      main="PM2.5 emissions from Motor Vehicles (on-road) (Baltimore City, MD)")

# 4. Write plot to a file
ggsave("plot5.png", width=7, height=3)