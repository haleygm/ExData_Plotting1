library(tidyverse)
#Note, must set working directory prior to running this file 
#Import Data and filter to correct dates 
data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")) 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]

# Add variables like date-time and weekday
subdata$dt <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
subdata$weekday <- weekdays(subdata$Date)

# Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px" )
plot(subdata$dt, subdata$Global_active_power, ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "l", lty = "solid")
dev.off()

