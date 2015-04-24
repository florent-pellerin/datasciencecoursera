library('ggplot2')

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_filtered <- NEI[NEI$fips %in% c("24510", "06037"),]
names(NEI_filtered) <- c("city","SCC","Pollutant","Emissions","type","year")
NEI_filtered$city[NEI_filtered$city == "24510"] <- "Baltimore City"
NEI_filtered$city[NEI_filtered$city == "06037"] <- "Los Angeles County"
NEI_filtered$city <- as.factor(NEI_filtered$city)

NEI_filtered$SCC <- as.factor(NEI_filtered$SCC)
NEI_filtered$Pollutant <- as.factor(NEI_filtered$Pollutant)
NEI_filtered$type <- as.factor(NEI_filtered$type)
NEI_filtered$year <- as.factor(NEI_filtered$year)

merged <- merge(NEI_filtered, SCC[c("SCC", "Short.Name")])
veh <- merged[grep('Veh', merged$Short.Name),]

plot6 <- ggplot(veh, aes(year), fill=city) +
  geom_bar(aes(weight=Emissions), position="dodge") +
  ggtitle("Emissions from motor vehicle sources") +
  xlab("Year") +
  ylab("PM2.5 emissions, in tons")

ggsave(plot6, file="plot6.png")
