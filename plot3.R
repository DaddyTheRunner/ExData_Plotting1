##
## plot3.R
##
## DESCRIPTION:
## This file generates Plot #3 of the Exploratory Data Analysis
## class project #1
##
## The original data file was pre-processed using Class_Proj_1.R
## and the subset required for this plot was saved in a separate
## data file for use in the plot*.R files
##
## Read in the pre-processed subsetted data
colClasses <- c("Date", "POSIXct", rep("numeric", 7))
data <- read.table("./Data/subset-data.csv", header = TRUE,
                   sep = ",", colClasses = colClasses)

## Initialize a PNG file for the plot
png("plot3.png")

## Generate the plot
plot(data$Time, data$Sub_metering_1, type="l",
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"))

## Close the graphics device
dev.off()
