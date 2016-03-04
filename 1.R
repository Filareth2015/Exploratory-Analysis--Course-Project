library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

TotalEmissions <- 
                  NEI %>% 
                  group_by(year) %>%
                  summarise(SumEmissions = sum(Emissions))

barplot(height = TotalEmissions$SumEmissions, 
        names.arg = TotalEmissions$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years')
        ) 
                  
dev.copy(png, 
         file = "Plot1.png",
         width=1000,
         height=800
         ) 
dev.off()
                  
  


