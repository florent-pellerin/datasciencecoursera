library('ggplot2')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

merged <- merge(NEI, SCC[c("SCC", "Short.Name")])
coal <- merged[grep('coal', merged$Short.Name),]

plot4 <- ggplot(coal, aes(year)) +
  geom_bar(aes(weight=Emissions), position="dodge") +
  ggtitle("Emissions from coal combustion-related sources") +
  xlab("Year") +
  ylab("PM2.5 emissions, in tons")

ggsave(plot4, file="plot4.png")
