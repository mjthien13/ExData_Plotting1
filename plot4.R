#Importing Data
setwd("~/Desktop/RStudio Files/ExData_Plotting1")
data <- read.csv("~/Desktop/RStudio Files/ExData_Plotting1/CopyOfhousehold_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#Plotting Plot 4
data1$posix <- as.POSIXct(strptime(paste(data1$Date, data1$Time, sep = " "),format = "%Y-%m-%d %H:%M:%S"))
par(mfrow = c(2, 2))
with(data1, {
        plot(Global_active_power~posix, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~posix, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~posix, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~posix,col='Red')
        lines(Sub_metering_3~posix,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~posix, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

#Saving Plot 4 as png file
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
