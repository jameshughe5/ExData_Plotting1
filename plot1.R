# Load data set in R
setwd("~/R/ExData_Plotting1")
dat <- read.csv("~/R/ExData_Plotting1/household_power_consumption.txt", sep=";")

# Convert dates into date class and subset

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat2 <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
rm(dat)


# Plot a histogram of global active power (Plot 1)

hist(as.numeric(as.character(dat2$Global_active_power)), breaks = 12, col = "Red", 
             xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
             main = "Global Active Power")

# Save plot as PNG
dev.copy(png, 'plot1.png')
dev.off()

rm(list = ls())