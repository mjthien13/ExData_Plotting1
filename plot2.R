#Importing Data
setwd("~/Desktop/RStudio Files/ExData_Plotting1")
data <- read.csv("~/Desktop/RStudio Files/ExData_Plotting1/CopyOfhousehold_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#Plotting Plot 2
data1$posix <- as.POSIXct(strptime(paste(data1$Date, data1$Time, sep = " "),format = "%Y-%m-%d %H:%M:%S"))
with(data1,plot(Global_active_power~posix, type="l",ylab="Global Active Power (kilowatts)"))

#Saving Plot 2 as png file
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
