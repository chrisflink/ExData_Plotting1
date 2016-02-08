# Read data
source('read_data.R')

# Clean data
data2007$Global_active_power <- as.numeric(data2007$Global_active_power)

# Where to store the plot
fname <- paste(plots_dir, "plot1.png", sep = "/")

# Open png graphics device
png(filename=fname, width=480, height=480)

# Create plot
hist(data2007$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close graphics device and save file
dev.off()