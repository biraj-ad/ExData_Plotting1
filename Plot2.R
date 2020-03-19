library("data.table")
setwd('D:/4. Online Courses/6. EDA/Week1')

#Reading data
maindata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# For filtering and graphing
maindata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filtering required dates
maindata <- maindata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]


png("plot2.png", width=480, height=480)

## Plot 2
with(maindata, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

      