
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

sumByYear <- aggregate(Emissions ~ year,data=NEI,sum)
png("plot1.png", width=480, height=480, units="px")
plot(sumByYear, ylab = "Total PM2.5 emissions", xlab="Year")
dev.off()
