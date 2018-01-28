con <- file ("household_power_consumption.txt","r")

data <- read.delim(con,header = TRUE, sep = ";", stringsAsFactors = FALSE)

close(con)

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01")|Date == as.Date("2007-02-02"))

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

subdata$Date.and.Time <- strptime(paste(subdata$Date,subdata$Time), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))

with(subdata, {
  plot(Date.and.Time, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
  
  plot(Date.and.Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(Date.and.Time, Sub_metering_1, col = "black",type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Date.and.Time, Sub_metering_2, col = "red")
  lines(Date.and.Time, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),cex = 0.5,lwd = 1, bty = "n" )
  
  plot(Date.and.Time, Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global reactive Power")
  
})

dev.copy(png,"plot4.png")

dev.off()
