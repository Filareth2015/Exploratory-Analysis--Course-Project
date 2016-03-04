library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mrg <- merge(NEI, SCC, by = "SCC")

CoalMatches <- grepl("coal", mrg$Short.Name, ignore.case=TRUE)
mrgFiltered <- mrg[CoalMatches, ]

TotalEmissions <- 
  mrgFiltered %>% 
  group_by(year) %>%
  summarise(SumEmissions = sum(Emissions))

g <- ggplot(TotalEmissions, 
            aes(x = year, y = SumEmissions))
g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in US from coal combustion-related sources (1999 - 2008)') +
  ylim(0, 700000)

dev.copy(png, 
         file = "Plot4.png",
         width=1000,
         height=800
) 
dev.off()




