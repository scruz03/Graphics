## Plot 3

## Get the library needed to download the file
library("downloader")

url1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url1, "power.zip", mode = "wb")

## Unzip the file
unzip("power.zip")

## Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Get the library needed to work with time & date
library("lubridate")

# Create new variable in order to select just the rows between the dates specified
data$Date_Time <- dmy_hms(paste(data$Date, data$Time))

# fix the limits to select the rows
date1 <- dmy_hms("01-02-2007 00:00:00")
date2 <- dmy_hms("03-02-2007 00:00:00")

##  Get the library needed to filter
library("dplyr")

# filter the rows ...just those among the limits
data1 <- filter(data, Date_Time >= date1, Date_Time < date2)

# Open de graphical device in this case a png file
png(file="Plot3.png", width = 480, height = 480, units="px")

## Define some variables to save some typing
sub1 <- data1$Sub_metering_1
sub2 <- data1$Sub_metering_2
sub3 <- data1$Sub_metering_3

## Plot the data and fill with the other variables then
plot(fecha,sub1, type="l", xlab = "" , ylab= "Energy submetering")
points(sub2, type = "l", col="red")
points(fecha, sub2, type = "l", col="red")
points(fecha, sub3, type = "l", col="blue")
legend("topright",pch = "-", col = c("black", "red", "blue"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"))

# Turn the graphical device off
dev.off()
