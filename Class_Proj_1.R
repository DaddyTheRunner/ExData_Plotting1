##
## Class_Proj_1.R
##
## This R script contains the code required to read in and pre-process
## the data used in the first class project in the Exploratory Data
## Analysis class.  The pre-processed and sub-setted data is then
## saved in a new file for later use by the plot*.R scripts
##
library(dplyr)
library(tidyr)

## Read all of the data and then subset it
all.data <- read.table("./Data/household_power_consumption.txt",
                       sep=";", stringsAsFactors = FALSE,
                       header = TRUE, na.strings = "?")

all.data <- tbl_df(all.data)
all.data <- mutate(all.data, Date = as.Date(Date, format="%d/%m/%Y"))

## We will only be using data from the dates 2007-02-01 and 2007-02-02.
subset.data <- filter(all.data, Date >= as.Date("2007-02-01"),
                      Date <= as.Date("2007-02-02"))
rm(all.data)
gc()

## Clean up the data
subset.data <-
  mutate(subset.data,
         Time = as.POSIXct(strptime(paste(Date, Time),
                                    format="%Y-%m-%d %H:%M:%S")))
subset.data <- subset.data %>%
  mutate(Global_active_power = extract_numeric(Global_active_power),
         Global_reactive_power = extract_numeric(Global_reactive_power),
         Voltage = extract_numeric(Voltage),
         Global_intensity = extract_numeric(Global_intensity),
         Sub_metering_1 = extract_numeric(Sub_metering_1),
         Sub_metering_2 = extract_numeric(Sub_metering_2))

## Save the subsetted data for reuse
write.table(subset.data, "./Data/subset-data.csv",
            row.names=FALSE, col.names=TRUE,
            sep=",")

