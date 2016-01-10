# Create  a function for type casting
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y"))
# Read data with cast from character to Date
dt <- read.csv("household_power_consumption.txt",header=TRUE,sep = ";", colClasses = c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
# Subset by Date
dtf<-subset(dt, Date==as.Date("01/02/2007", format="%d/%m/%Y") | Date==as.Date("02/02/2007", format="%d/%m/%Y"))
# Generate the plot
png(filename = "Plot1.png",width = 480, height = 480)
hist(dtf$Global_active_power, col="firebrick1", main="Global Active Power", xlab="Global Active Power (kilowats)")
dev.off()
