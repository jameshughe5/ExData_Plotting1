# Load data set in R
setwd("~/R/ExData_Plotting1")
dat <- read.csv("~/R/ExData_Plotting1/household_power_consumption.txt", sep=";")

# Convert dates into date class day of week and subset

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat2 <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
rm(dat)

#Unify date and time

d_t <- strptime(paste(dat2$Date, dat2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
g_a_p <- as.numeric(as.character(dat2$Global_active_power))

#Plot global active power as a function of day of week

plot(d_t, g_a_p, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Save as PNG file
dev.copy(png, 'plot2.png')
dev.off()

rm(list = ls())
