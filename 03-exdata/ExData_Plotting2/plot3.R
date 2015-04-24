library('ggplot2')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

NEI_Baltimore <- NEI[NEI$fips == "24510",]

plot3 <- ggplot(NEI_Baltimore, aes(type, fill=year)) +
  geom_bar(aes(weight=Emissions), position="dodge") +
  ggtitle("Total PM2.5 emissions in Baltimore City, Maryland by source type by year") +
  xlab("Type of Source") +
  ylab("Total PM2.5 emissions in Baltimore City, Maryland")

ggsave(plot3, file="plot3.png")
