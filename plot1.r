
# Generate and save to a file - Plot # 1 

epc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", 
                  na.strings = "?", stringsAsFactors = FALSE)

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

# get the desired subset
epc2 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

# creating a datetime object
epc2$Datetime <- strptime(paste(epc2$Date, epc2$Time), format="%Y-%m-%d %H:%M:%S")

# print to png
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# plot #1
hist(epc2$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()



