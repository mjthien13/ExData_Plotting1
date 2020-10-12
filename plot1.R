#Importing Data
setwd("~/Desktop/RStudio Files/ExData_Plotting1")
data <- read.csv("~/Desktop/RStudio Files/ExData_Plotting1/CopyOfhousehold_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#Plotting the histogram Plot 1
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Saving Plot 1 as png file
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
