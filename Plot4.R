library("data.table")
setwd('D:/4. Online Courses/6. EDA/Week1')

#Reading data
maindata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# For filtering and graphing
maindata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
maindata <- maindata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Plot4
plot(maindata[, dateTime], maindata[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(maindata[, dateTime],maindata[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(maindata[, dateTime], maindata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(maindata[, dateTime], maindata[, Sub_metering_2], col="red")
lines(maindata[, dateTime], maindata[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(maindata[, dateTime], maindata[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

