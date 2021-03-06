### File created by: Rene Lacroix
### Date: 10 April 2015
### Name of file: plot1.R


# Specify working directory

setwd("C:/DataProjects/R/RprogCourse/ExploDataAna/Project1")


# Data source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# File structure 
# 1.Date: Date in format dd/mm/yyyy 
# 2.Time: time in format hh:mm:ss 
# 3.Global_active_power: household global minute-averaged active power (in kilowatt) 
# 4.Global_reactive_power: household global minute-averaged reactive power (in kilowatt) 
# 5.Voltage: minute-averaged voltage (in volt) 
# 6.Global_intensity: household global minute-averaged current intensity (in ampere) 
# 7.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
# 8.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
# 9.Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner


# Read the file into data frame

my_file <- "household_power_consumption.txt"
tmp_elec_dat <- read.table(my_file, header = TRUE, sep = ";",na.strings = "?")


# Convert the Date variable to date class

tmp_elec_dat$FDate <- as.Date(tmp_elec_dat$Date, "%d/%m/%Y")


# Keep data from the dates 2007-02-01 and 2007-02-02. 

minDate <- as.Date("2007-02-01")
maxDate <- as.Date("2007-02-02")

elec_dat <- tmp_elec_dat[tmp_elec_dat$FDate >= minDate & tmp_elec_dat$FDate <= maxDate,]


# Make plot 1 and save to png file (480*480 pixels)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent")
hist(elec_dat$Global_active_power, main = "Global Active Power", col = "red", breaks = 20, ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)")
dev.off()

# End of file