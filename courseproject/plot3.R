# read the file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)),na.string='?')

# conver the date variable to date class:
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# subtset the two days' data
dat <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]

# convert the Date/Time variables to Date/Time class
dat$Date <- as.POSIXlt(paste(as.Date(dat$Date, format="%d/%m/%Y"), dat$Time, sep=" "))

#create plot3
png("plot3")
plot(dat$Date, dat$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")

lines(dat$Date, dat$Sub_metering_1, col="black")
lines(dat$Date, dat$Sub_metering_2, col="red")
lines(dat$Date, dat$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.off()