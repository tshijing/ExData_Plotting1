# read the file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)),na.string='?')

# convert the Date variable to Date classe
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# subtset the two days' data
dat <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]

#create plot1
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()