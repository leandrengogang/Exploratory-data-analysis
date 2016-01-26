setwd("C:/R Project/Courses/Coursera training/Exploratory Data Analysis/Course project/")

dataFile <- "household_power_consumption.txt" ##reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] ##subseting the data

## Changing data format
dtime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data2$Global_active_power)
SM1 <- as.numeric(data2$Sub_metering_1)
SM2 <- as.numeric(data2$Sub_metering_2)
SM3 <- as.numeric(data2$Sub_metering_3)

## Ploting data
png("plot3.png", width=480, height=480)
plot(dtime, SM1, type="l", ylab="Energy sub metering", xlab="")
lines(dtime, SM2, type="l", col="red")
lines(dtime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1, lwd=2.5)
dev.off()