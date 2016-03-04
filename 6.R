library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalEmissionsBaltimore <- 
  NEI %>% 
  filter(fips == "24510", type == "ON-ROAD") %>%
  group_by(year) %>%
  summarise(SumEmissions = sum(Emissions))

TotalEmissionsLosAngeles <- 
  NEI %>% 
  filter(fips == "06037", type == "ON-ROAD") %>%
  group_by(year) %>%
  summarise(SumEmissions = sum(Emissions))

rng <- c(0, 5000)

par(mfrow = c(1, 2))
barplot(height = TotalEmissionsBaltimore$SumEmissions, 
        names.arg = TotalEmissionsBaltimore$year, 
        xlab="years", 
        ylab=expression('Emissions PM'[2.5]*' emission'),
        main=expression('Total emissions from motor vehicle sources 
                        Baltimore City, Maryland'),
        ylim = rng 
       )
barplot(height = TotalEmissionsLosAngeles$SumEmissions, 
        names.arg = TotalEmissionsLosAngeles$year, 
        xlab="years", 
        ylab=expression('Emissions PM'[2.5]*' emission'),
        main=expression('Total emissions from motor vehicle sources
                        Los Angeles County'),
        ylim = rng
       )

dev.copy(png, 
         file = "Plot6.png",
         width=1000,
         height=800
) 
dev.off()




