library(dplyr)
# Getting required 2days of data
rawfile <- file('./data/household_power_consumption.txt')
householdpowerdata <- read.table(text = grep("^[1,2]/2/2007",readLines(rawfile),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 4
# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot4.png', width = 480, height = 480, units='px')
# plot figure
par(mfrow = c(2, 2))
plot(householdpowerdata$DateTime, householdpowerdata$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(householdpowerdata$DateTime, householdpowerdata$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(householdpowerdata$DateTime, householdpowerdata$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(householdpowerdata$DateTime, householdpowerdata$Sub_metering_2, col = 'red')
lines(householdpowerdata$DateTime, householdpowerdata$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(householdpowerdata$DateTime, householdpowerdata$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close device
dev.off()