##Reading and preparing data
expl_data <- read.table("./household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", nrows=100000)
data <- expl_data[expl_data$Date %in% c("1/2/2007", "2/2/2007"),]
Sys.setlocale("LC_TIME", "English")

##Creating png
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

##Creating plot 3
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$Date, data$Sub_metering_1, type="l", xlab=" ", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue") 
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub-metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
