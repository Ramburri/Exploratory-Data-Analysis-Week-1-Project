library(dplyr)
# Getting required 2days of data
rawfile <- file('./data/household_power_consumption.txt')
householdpowerdata <- read.table(text = grep("^[1,2]/2/2007",readLines(rawfile),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 2
# convert data and time to specific format
householdpowerdata$Date <- as.Date(householdpowerdata$Date, format = '%d/%m/%Y')
householdpowerdata$DateTime <- as.POSIXct(paste(householdpowerdata$Date, householdpowerdata$Time))
# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width = 480, height = 480, units='px')
# plot figure
plot(householdpowerdata$DateTime, householdpowerdata$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
# close device
dev.off()