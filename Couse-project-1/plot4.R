setwd("C:/R Project/Courses/Coursera training/Exploratory Data Analysis/Course project/")

dataFile <- "household_power_consumption.txt" ##reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]##subseting the data

## Changing data format
dtime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gapower <- as.numeric(data2$Global_active_power)
voltage <- as.numeric(data2$Voltage)
SM1 <- as.numeric(data2$Sub_metering_1)
SM2 <- as.numeric(data2$Sub_metering_2)
SM3 <- as.numeric(data2$Sub_metering_3)
grpower <- as.numeric(data2$Global_reactive_power)

## Ploting data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))  ##matrix of four plots

plot(dtime, gapower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dtime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dtime, SM1, type="l", ylab="Energy Sub metering", xlab="")

lines(dtime, SM2, type="l", col="red")
lines(dtime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtime, grpower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()