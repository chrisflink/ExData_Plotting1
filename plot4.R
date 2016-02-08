# Read data
#source('read_data.R')

# Clean data
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

# Merge date and time
date_time <- strptime(paste(data2007$Date, data2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Where to store the plot
fname <- paste(plots_dir, "plot4.png", sep = "/")

# Open png graphics device
png(filename=fname, width=480, height=480)

# Create layout
par(mfrow=c(2,2),mar=c(4,4,2,2))

# Create plot 1
plot(date_time, data2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Create plot 2
plot(date_time, data2007$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Create plot 3
plot(date_time, data2007$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, data2007$Sub_metering_2, type="l", col="red")
lines(date_time, data2007$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2, lty=1)

# Create plot 4
plot(date_time, data2007$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Voltage")

# Close graphics device and save file
dev.off()
