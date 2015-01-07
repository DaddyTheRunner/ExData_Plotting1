##
## plot2.R
##
## DESCRIPTION:
## This file generates Plot #2 of the Exploratory Data Analysis
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
png("plot2.png")

## Generate the plot
plot(data$Time, data$Global_active_power, type="l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the graphics device
dev.off()
