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

data <- data %>% filter((fips == "24510" | fips == "06037") & SCC %in% sc$SCC) %>% group_by(Year=year, Fips=fips) %>% summarise(Emissions=sum(Emissions))

data$Fips = factor(x = data$Fips, 
                   levels = c('06037','24510'),
                   labels = c('Los Angeles, CA','Baltimore City, MD'))

# 3. Draw Plot
qplot(Year, Emissions, data=data, geom="line", facets=.~Fips,
      main="PM2.5 emissions from Motor Vehicles (on-road)")

# 4. Write plot to a file
ggsave("plot6.png", width=6, height=3)