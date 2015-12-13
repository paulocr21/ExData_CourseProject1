
# Plot # 3 - Generate and save to a file

# read file
epc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", 
                  na.strings = "?", stringsAsFactors = FALSE)

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# get the desired subset
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# create a datetime column
epc2$Datetime <- strptime(paste(epc2$Date, epc2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

# plot #3
plot(epc2$Datetime, epc2$Sub_metering_1, 
     ylab = "Energy sub metering",  xlab ="", type = "l")
points(epc2$Datetime, epc2$Sub_metering_2, type = "l", col = "red")
points(epc2$Datetime, epc2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1.5, col=c("black", "red", "blue"))

dev.off()



