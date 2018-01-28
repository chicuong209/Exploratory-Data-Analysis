con <- file ("household_power_consumption.txt","r")

data <- read.delim(con,header = TRUE, sep = ";", stringsAsFactors = FALSE)

close(con)

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01")|Date == as.Date("2007-02-02"))

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

subdata$Date.and.Time <- strptime(paste(subdata$Date,subdata$Time), format = "%Y-%m-%d %H:%M:%S")

with(subdata, plot(Date.and.Time, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))

dev.copy(png,"plot2.png")

dev.off()