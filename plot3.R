# Load data set in R
setwd("~/R/ExData_Plotting1")
dat <- read.csv("~/R/ExData_Plotting1/household_power_consumption.txt", sep=";")

# Convert dates into date class day of week and subset

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat2 <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
rm(dat)

#Unify date and time

d_t <- strptime(paste(dat2$Date, dat2$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

#Plot data

plot(d_t, as.numeric(as.character(dat2$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = "")
lines(d_t, as.numeric(as.character(dat2$Sub_metering_2)), type = "l", col = "Red")
lines(d_t, as.numeric(as.character(dat2$Sub_metering_3)), type = "l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, cex = 0.75, col=c("Black", "Red","Blue"))
       
# Save as a png file
dev.copy(png, 'plot3.png')
dev.off()

rm(list = ls())
