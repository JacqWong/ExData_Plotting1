# Load data table from website https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data table 
library("data.table")
powerdt <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Rename columns
names(powerdt) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset dates :2007-02-01 and 2007-02-02
subpowerdt<- subset(powerdt,powerdt$Date=="1/2/2007" | powerdt$Date =="2/2/2007")
#convert factor to numeric
GlobalActivePower <- as.numeric(as.character(subpowerdt$Global_active_power))

#Create plot 1: Histogram of Global_active_power
hist(GlobalActivePower, main="Global Active Power", 
    xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save as png
dev.copy(png, 'plot1.png')
dev.off()
