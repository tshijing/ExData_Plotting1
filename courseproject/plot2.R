# read the file
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c(rep("character", 2), rep("numeric", 7)),na.string='?')

# conver the date variable to date class:
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# subtset the two days' data
dat <- dat[dat$Date >= as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]

# convert the Date/Time variables to Date/Time class
dat$Date <- as.POSIXlt(paste(as.Date(dat$Date, format="%d/%m/%Y"), dat$Time, sep=" "))

#create plot2
png(filename="plot2.png", width=480, height=480)
plot(dat$Date, dat$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)",  type="l")

dev.off()