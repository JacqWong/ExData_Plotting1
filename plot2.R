# Load data table from website https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data table 
library("data.table")
powerdt <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Rename columns
names(powerdt) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset dates :2007-02-01 and 2007-02-02
subpowerdt<- subset(powerdt,powerdt$Date=="1/2/2007" | powerdt$Date =="2/2/2007")
#combine Date and Time
datetime <- strptime(paste(subpowerdt$Date, subpowerdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert factor to numeric
GlobalActivePower <- as.numeric(as.character(subpowerdt$Global_active_power))
#plot date against global active power
plot(datetime, GlobalActivePower,
     type="l",xlab="",ylab="Global Active Power (kilowatts)")
#save plot
dev.copy(png, 'plot2.png')
dev.off()
