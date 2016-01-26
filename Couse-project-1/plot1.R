setwd("C:/R Project/Courses/Coursera training/Exploratory Data Analysis/Course project/")

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

## Changing data format
data$Time<-as.Date(data$Time, "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data2<-data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),] ## Subseting the data

## Creation of histogram
png("plot1.png", width=480, height=480)
hist(data2$Global_active_power, col="red", xlab="Global Active Power (Kilowatts)", ylab="Frequency", main="Global Active Power")

dev.off()