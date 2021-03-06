# Read the data
dt <- read.csv("household_power_consumption.txt",header=TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
# Subset the dataframe
dtf<-subset(dt, Date=="1/2/2007" | Date=="2/2/2007")
# Add a column with date and time
dtf$datetime <- strptime(paste(dtf$Date, dtf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Generate the plot 
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Plot @ 1,1
with(dtf, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#Plot @ 1,2
with(dtf, plot(datetime, Voltage, type="l"))
#Plot @ 2,1
with(dtf, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(dtf, lines(datetime, Sub_metering_2, type="l", col="red"))
with(dtf, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Plot @ 2,2
with(dtf, plot(datetime, Global_reactive_power, type="l"))
dev.off()
