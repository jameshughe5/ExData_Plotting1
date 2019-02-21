# Load data set in R
setwd("~/R/ExData_Plotting1")
dat <- read.csv("~/R/ExData_Plotting1/household_power_consumption.txt", sep=";")

# Convert dates into date class day of week and subset

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat2 <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02",]
rm(dat)

#Unify date and time

d_t <- strptime(paste(dat2$Date, dat2$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


# Plot all four panels together
par(mfrow=c(2,2))
attach(dat2)

#Plot Top_Left
      plot(d_t, as.numeric(as.character(dat2$Global_active_power)), 
     type="l", xlab="", ylab= "Global Active Power")

#Plot Top_Right
      plot(d_t, as.numeric(as.character(dat2$Voltage)), 
          type = "l", xlab = "datetime", ylab= "Voltage")

#Plot Bottom_Left
      plot(d_t, as.numeric(as.character(dat2$Sub_metering_1)), type = "l", 
           ylab = "Energy sub metering", xlab = "")
      lines(d_t, as.numeric(as.character(dat2$Sub_metering_2)), type = "l", col = "Red")
      lines(d_t, as.numeric(as.character(dat2$Sub_metering_3)), type = "l", col = "Blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
          lty=1, cex = 0.5, bty = "n", col=c("Black", "Red","Blue"))

#Plot Bottom_Right
      plot(d_t, as.numeric(as.character(dat2$Global_reactive_power)), type="l", 
                              xlab= "datetime", ylab="Global_reactive_power")

# Save as a png file
dev.copy(png, 'plot4.png')
dev.off()

rm(list = ls())