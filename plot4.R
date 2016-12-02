# Coursera - Data Science
# Exploratory Data Analysis - Week 1 Project
# John Clune

# PLOT 4 ------------------------------------------------------------

# Pulls data and summarizes
power <- read.table("C:/Users/juc71/datasciencecoursera/ExploratoryAnalysis/Project1/elec_power_consumption/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
head(power)
str(power)
summary(power)

# Filters data to Feb 1 & 2
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power_feb <- subset(power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
power_feb$dateTime <- paste(power_feb$Date, power_feb$Time)
power_feb$dateTime <- as.POSIXct(power_feb$dateTime)
head(power_feb)
str(power_feb)
summary(power_feb)

# Creates and Saves 4 Time Series Plots
png(filename = 'C:/Users/juc71/datasciencecoursera/ExploratoryAnalysis/Project1/elec_power_consumption/plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))
plot(power_feb$dateTime, power_feb$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
plot(power_feb$dateTime, power_feb$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(power_feb$dateTime, power_feb$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(power_feb$dateTime, power_feb$Sub_metering_2, col = 'red')
lines(power_feb$dateTime, power_feb$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1, bty ="n")
plot(power_feb$dateTime, power_feb$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
