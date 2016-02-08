# Read data
source('read_data.R')

# Clean data
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

# Merge date and time
date_time <- strptime(paste(data2007$Date, data2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Where to store the plot
fname <- paste(plots_dir, "plot2.png", sep = "/")

# Open png graphics device
png(filename=fname, width=480, height=480)

# Create plot
plot(date_time, data2007$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close graphics device and save file
dev.off()
