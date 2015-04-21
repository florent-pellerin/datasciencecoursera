x <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',
              header=TRUE,
              sep=";",
              na.strings="?",
              quote="",
              comment.char="")
x <- x[x$Date %in% c("1/2/2007", "2/2/2007"),]
png("plot1.png", width=480, height=480, units="px")
hist(x$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
