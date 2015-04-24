library('ggplot2')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

NEI_Baltimore <- NEI[NEI$fips == "24510",]
merged <- merge(NEI_Baltimore, SCC[c("SCC", "Short.Name")])
veh <- merged[grep('Veh', merged$Short.Name),]

plot5 <- ggplot(veh, aes(year)) +
  geom_bar(aes(weight=Emissions), position="dodge") +
  ggtitle("Emissions from motor vehicle sources in Baltimore City") +
  xlab("Year") +
  ylab("PM2.5 emissions, in tons")

ggsave(plot5, file="plot5.png")