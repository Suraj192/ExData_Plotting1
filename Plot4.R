library(dplyr)
library(anytime)
library(microbenchmark)
our_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
our_data$Date <- as.Date(our_data$Date, format = "%d/%m/%Y")
subdta <- subset(our_data, Date == "2007-02-01" | Date == "2007-02-02")

subdta <- mutate(subdta, datetime = paste(Date, Time))
subdta$datetime <- anytime(as.factor(subdta$datetime))

#plot 4
par(mfrow = c(2,2), mar = c(4,4,2,2))

with(subdta, plot(x= datetime, y= as.numeric(levels(subdta$Global_active_power)[subdta$Global_active_power]), xlab = "", ylab = "Global Active Power (kilowatts)", type='l'))

with(subdta, plot(x=datetime, y=as.numeric(levels(subdta$Voltage)[subdta$Voltage]), xlab = "datetime", ylab = "Voltage", type = 'l'))

plot(x=subdta$datetime, y= as.numeric(levels(subdta$Sub_metering_1)[subdta$Sub_metering_1]) , type="l", col="black", xlab="", ylab="Energy sub metering")
lines(x=subdta$datetime, y=as.numeric(levels(subdta$Sub_metering_2)[subdta$Sub_metering_2]), col = "red")
lines(x=subdta$datetime, y=subdta$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.6)

with(subdta, plot(datetime, as.numeric(levels(Global_reactive_power)[Global_reactive_power]), ylab = "Global_reactive_power", type = 'l'))

dev.copy(png, file="Plot 4.png")
dev.off()
