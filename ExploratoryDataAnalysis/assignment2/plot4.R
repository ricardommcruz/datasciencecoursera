library(dplyr)
library(ggplot2)

# 1. Read data
data <- readRDS("summarySCC_PM25.rds")
sc <- readRDS("Source_Classification_Code.rds")

# 2. Transform/convert
#
# The question is ambiguous. This solution summarises only those
# Coal combustion sources that are related with providing fuel.
# The majority of coal is burned for fuel.
#
sc <- sc %>% filter(grepl("Coal", sc$EI.Sector))

data <- data %>% filter(SCC %in% sc$SCC) %>% group_by(Year=year) %>% summarise(Emissions=sum(Emissions))

# 3. Draw Plot
qplot(Year, Emissions, data=data, geom="line",
      main="Coal combustion (as fuel) PM2.5 emissions (whole of United States)")

# 4. Write plot to a file
ggsave("plot4.png", width=7, height=3)