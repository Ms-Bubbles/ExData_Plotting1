##Reading and preparing data
expl_data <- read.table("./household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", nrows=100000)
data <- expl_data[expl_data$Date %in% c("1/2/2007", "2/2/2007"),]
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

##Creating png
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

##Creating plot 4
par(mfrow=c(2,2))
with(data, {
  plot(Date, Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)")
  plot(Date, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(Date, Sub_metering_1, type="l", xlab=" ", ylab = "Energy sub metering")
  lines(Date, Sub_metering_2, type="l", col="red")
  lines(Date, Sub_metering_3, type="l", col="blue") 
  legend("topright", pch="-", cex = 0.8, col=c("black", "red", "blue"), legend=c("Sub-metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  plot(Date, Global_reactive_power, type="l", xlab = "datetime")
  axis(2,at=seq(0,0.5,0.1))
})

dev.off()
