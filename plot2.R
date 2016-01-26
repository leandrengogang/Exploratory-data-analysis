setwd("C:/R Project/Courses/Coursera training/Exploratory Data Analysis/Course project/")

dataFile <- "household_power_consumption.txt"  ##reading data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]  ##subseting the data

## Changing data format (concatenation)
dtime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data2$Global_active_power)

##Ploting the data
png("plot2.png", width=480, height=480)
plot(dtime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()