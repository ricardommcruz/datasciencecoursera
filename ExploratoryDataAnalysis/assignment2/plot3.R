library(dplyr)
library(ggplot2)

# 1. Read data
data <- readRDS("summarySCC_PM25.rds")

# 2. Filter rows, group by year and summarise for a nice graph
data <- data %>% filter(fips == "24510") %>% group_by(Year=year, Type=type) %>% summarise(Emissions=sum(Emissions))

# 3. Draw Plot
qplot(Year, Emissions, data=data, geom="line", facets=.~Type,
            main="PM2.5 emissions per measurement type (Baltimore City, MD)")

# 4. Write plot to a file
ggsave("plot3.png", width=12, height=4)