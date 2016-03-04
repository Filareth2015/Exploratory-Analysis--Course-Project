library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalEmissions <- 
                  NEI %>% 
                  filter(fips == 24510) %>%
                  group_by(year) %>%
                  summarise(SumEmissions = sum(Emissions))

barplot(height = TotalEmissions$SumEmissions, 
                 names.arg = TotalEmissions$year, 
                 xlab="years", ylab=expression('total PM'[2.5]*' emission'),
                 main=expression('Total PM'[2.5]*' emissions at various years in Baltimore City, Maryland')
        ) 

dev.copy(png, 
         file = "Plot2.png",
         width=1000,
         height=800
         ) 
dev.off()




