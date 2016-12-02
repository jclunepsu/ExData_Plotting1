# Coursera - Data Science
# Exploratory Data Analysis - Week 1 Project
# John Clune

# PLOT 1 ------------------------------------------------------------

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

# Creates histogram of Global Active Power
plot1 <- hist(power_feb$Global_active_power, col="red", main="Global Active Power", ylab = "Frequency", xlab="Global Active Power (kilowatts)")

# Saves plot as PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = 'C:/Users/juc71/datasciencecoursera/ExploratoryAnalysis/Project1/elec_power_consumption/plot1.png', width = 480, height = 480)
with(power_feb, hist(power_feb$Global_active_power, col="red", main="Global Active Power", ylab = "Frequency", xlab="Global Active Power (kilowatts)"))
dev.off()
