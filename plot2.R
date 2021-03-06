d <- read.csv("household_power_consumption.txt", sep = ';', skip=66636, nrows=2880, na.strings='?')
names(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
timeline<-strptime(paste(d[,"Date"], d[,"Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(timeline, d[,"Global_active_power"], type='l', xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()

#Experimentation code
#plot(timeline, d[,"Global_active_power"], type='l', xlab="", ylab = "Global Active Power (kilowatts)")
