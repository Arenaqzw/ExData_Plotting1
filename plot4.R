mydata <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",colClasses = c(rep("character", 2), rep("numeric", 7)))
data1 <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(data1$Date, data1$Time), format = "%d/%m/%Y %H:%M:%S")

#create frame
par(mfrow = c(2,2))

#topleft
with(data1, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))     

#topright
with(data1,  plot(datetime, Voltage, type = "l"))

#bottomleft
with(data1, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(datetime, data1$Sub_metering_1, col = "black")
lines(datetime, data1$Sub_metering_2, col = "red")
lines(datetime, data1$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottomleft
with(data1, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
