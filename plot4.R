library(tidyverse)
#Note, must set working directory prior to running this file 
# Import Data and filter to correct dates 
data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")) 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]

# Manipulate data by adding date-time column and weekday column 
subdata$dt <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
subdata$weekday <- weekdays(subdata$Date)

# Plot and export as png 
png(filename = "plot4.png", width = 480, height = 480, units = "px" )
par(mfcol = c(2,2), mar = c(4, 5, 3.5, 3.5))
plot(subdata$dt, subdata$Global_active_power, ylab = "Global Active Power", 
     xlab = "", type = "l", lty = "solid")
plot(subdata$dt, subdata$Sub_metering_1, ylab = "Energy sub metering", 
     xlab = "", type = "l", lty = "solid", col = "black")
points(subdata$dt, subdata$Sub_metering_2, type = "l", col = "red")
points(subdata$dt, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c("solid", "solid", "solid"), cex = 0.5, bty = "n")
plot(subdata$dt, subdata$Voltage, ylab = "Voltage", xlab = "datetime", type = "l", lty = "solid")
plot(subdata$dt, subdata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l", lty = "solid")
dev.off()
