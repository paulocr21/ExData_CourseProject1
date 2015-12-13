
# Plot # 2 - Generate and save to a file 

# read file
epc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", 
                  na.strings = "?", stringsAsFactors = FALSE)

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# get the desired subset
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# create a datetime column
epc2$Datetime <- strptime(paste(epc2$Date, epc2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png
png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

# plot #2
plot(epc2$Datetime, epc2$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",  xlab ="", type = "l")

dev.off()



