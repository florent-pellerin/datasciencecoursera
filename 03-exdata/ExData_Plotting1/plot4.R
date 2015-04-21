x <- read.csv('exdata_data_household_power_consumption/household_power_consumption.txt',
              header=TRUE,
              sep=";",
              na.strings="?",
              quote="",
              comment.char="")



x <- x[x$Date %in% c("1/2/2007", "2/2/2007"),]
x <- within(x, { timestamp=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S") })

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))
par(mar=c(4, 4, 2, 2))

plot(Global_active_power ~ timestamp, x, type='l', ylab = "Global Active Power", xlab="")

plot(Voltage ~ timestamp, x, type='l', ylab = "Voltage", xlab="datetime")

plot(Sub_metering_1 ~ timestamp, x, type='l', ylab = "Energy sub metering", xlab="")
lines(Sub_metering_2 ~ timestamp, x, type='l', col = 'red')
lines(Sub_metering_3 ~ timestamp, x, type='l', col = 'blue')
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1), bty='n')

plot(Global_reactive_power ~ timestamp, x, type='l', ylab = "Global_reactive_power", xlab="datetime")

dev.off()
