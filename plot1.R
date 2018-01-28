con <- file ("household_power_consumption.txt","r")

data <- read.delim(con,header = TRUE, sep = ";", stringsAsFactors = FALSE)

close(con)

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

subdata <- subset(data, Date == as.Date("2007-02-01")|Date == as.Date("2007-02-02"))

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

with(subdata, hist(Global_active_power,xlab = "Global_active_power(kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power"))

dev.copy(png, file = "plot1.png")

dev.off()
