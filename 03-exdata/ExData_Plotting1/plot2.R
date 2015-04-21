x <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',
              header=TRUE,
              sep=";",
              na.strings="?",
              quote="",
              comment.char="")



x <- x[x$Date %in% c("1/2/2007", "2/2/2007"),]
x <- within(x, { timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S") })

png("plot2.png", width=480, height=480, units="px")
plot(Global_active_power ~ timestamp, x, type='l', ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
