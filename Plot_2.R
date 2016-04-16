## Plot 2
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


## Define a couple of variables to save some typing
fecha <-data1$Date_Time
gap <-data1$Global_active_power

# Open de graphical device in this case a png file
png(file="Plot2.png", width = 480, height = 480, units="px")

# Create the plot
plot(fecha,gap, type="l", xlab = "" , ylab= "Global Active Power (kilowatts)")

# Turn off the graphical device
dev.off()
