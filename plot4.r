
# Plot # 4 - Generate and save to a file

# read file
epc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", 
                  na.strings = "?", stringsAsFactors = FALSE)

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# get the desired subset
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# create a datetime column
epc2$Datetime <- strptime(paste(epc2$Date, epc2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png
png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

# plot #4
par(mfrow = c(2,2))

# row 1, column 1
plot(epc2$Datetime, epc2$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",  xlab ="", type = "l")

# row 1, column 2
plot(epc2$Datetime, epc2$Voltage, type = "l", xlab = "datetime", ylab ="Voltage")

# row 2, column 1
plot(epc2$Datetime, epc2$Sub_metering_1, 
     ylab = "Energy sub metering",  xlab ="", type = "l")
points(epc2$Datetime, epc2$Sub_metering_2, type = "l", col = "red")
points(epc2$Datetime, epc2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1.5, cex=0.9, col=c("black", "red", "blue"), bty = "n")

# row 2, column 2
plot(epc2$Datetime, epc2$Global_reactive_power, type = "l", xlab = "datetime", ylab ="Global_active_power")

dev.off()



