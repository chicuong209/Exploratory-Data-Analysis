con <- file ("household_power_consumption.txt","r")

data <- read.delim(con,header = TRUE, sep = ";", stringsAsFactors = FALSE)

close(con)

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01")|Date == as.Date("2007-02-02"))

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

subdata$Date.and.Time <- strptime(paste(subdata$Date,subdata$Time), format = "%Y-%m-%d %H:%M:%S")

with(subdata, {
  plot(Date.and.Time, Sub_metering_1, col = "black",type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Date.and.Time, Sub_metering_2, col = "red")
  lines(Date.and.Time, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), cex = 1, lwd = 1)
})

dev.copy(png,"plot3.png")

dev.off()