library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalEmissions <- 
  NEI %>% 
  filter(fips == 24510) %>%
  group_by(year, type) %>%
  summarise(SumEmissions = sum(Emissions))

g <- ggplot(TotalEmissions, 
            aes(x = year, y = SumEmissions, color = type))
g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (1999 - 2008)')

dev.copy(png, 
         file = "Plot3.png",
         width=1000,
         height=800
) 
dev.off()




