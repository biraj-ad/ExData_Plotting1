library("data.table")
setwd('D:/4. Online Courses/6. EDA/Week1')
#Reading data
maindata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Change Date to required format
maindata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
maindata <- maindata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
with(maindata, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))
dev.off()

