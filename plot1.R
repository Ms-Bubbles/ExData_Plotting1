##Reading and preparing data
expl_data <- read.table("./household_power_consumption.txt", header=TRUE, sep =";", na.strings="?", nrows=100000)
data <- expl_data[expl_data$Date %in% c("1/2/2007", "2/2/2007"),]
Sys.setlocale("LC_TIME", "English")

data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##Creating png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

##Creating plot 1
hist(data$Global_active_power, main ="Global Active Power", xlab ="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")
axis(2,at=seq(0,1200,200))

dev.off()

