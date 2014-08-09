##Reading and preparing data
expl_data <- read.table("./household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", nrows=100000)
data <- expl_data[expl_data$Date %in% c("1/2/2007", "2/2/2007"),]
Sys.setlocale("LC_TIME", "English")

##Creating png
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

##Creating plot 2
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$Date, data$Global_active_power, type="l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()
