d <- read.csv("household_power_consumption.txt", sep = ';', skip=66636, nrows=2880, na.strings='?')
names(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
timeline<-strptime(paste(d[,"Date"], d[,"Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Open png device
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Sub Plot 1
plot(timeline, d[,"Global_active_power"], type='l', col = "black", xlab = "", ylab = "Global Active Power")

# Sub Plot 2
plot(timeline, d[,"Voltage"], type='l', col = "black", xlab = "datetime", ylab = "Voltage")

# Sub Plot 3
plot(timeline, d[,"Sub_metering_1"], type='l', col = "black", xlab = "", ylab = "Energy sub metering")
lines(timeline, d[,"Sub_metering_2"], type='l', col = "red")
lines(timeline, d[,"Sub_metering_3"], type='l', col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Sub Plot 4
plot(timeline, d[,"Global_reactive_power"], type='l', col = "black", xlab = "datetime", ylab = "Global_reactive_power")

# Close png device
dev.off()
