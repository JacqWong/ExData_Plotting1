#Load data table from website https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read data table 
library("data.table")
powerdt <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Rename columns
names(powerdt) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subset dates :2007-02-01 and 2007-02-02
subpowerdt<- subset(powerdt,powerdt$Date=="1/2/2007" | powerdt$Date =="2/2/2007")
#combine Date and Time
datetime <- strptime(paste(subpowerdt$Date, subpowerdt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# change factor to numeric
subMetering1 <- as.numeric(subpowerdt$Sub_metering_1)
subMetering2 <- as.numeric(subpowerdt$Sub_metering_2)
subMetering3 <- as.numeric(subpowerdt$Sub_metering_3)

#plot graph
plot(datetime, subMetering1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2,col="red")
lines(datetime, subMetering3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#save as png 
dev.copy(png, 'plot3.png')
dev.off()