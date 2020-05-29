library(tidyverse)
#Note, must set working directory prior to running this file 
# Import Data and filter to correct dates 
data <- as.data.frame(read.csv("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")) 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]


# Plot and export as png
png(filename = "plot1.png", width = 480, height = 480, units = "px" )
hist(subdata$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
