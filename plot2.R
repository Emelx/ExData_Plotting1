# Read the data
dt <- read.csv("household_power_consumption.txt",header=TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
# Subset the dataframe
dtf<-subset(dt, Date=="1/2/2007" | Date=="2/2/2007")
# Add a column with date and time
dtf$datetime <- strptime(paste(dtf$Date, dtf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Generate the plot
png("plot2.png", width=480, height=480)
with(dtf, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
