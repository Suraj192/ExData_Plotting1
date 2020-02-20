library(dplyr)
library(anytime)
library(microbenchmark)
our_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
our_data$Date <- as.Date(our_data$Date, format = "%d/%m/%Y")
subdta <- subset(our_data, Date == "2007-02-01" | Date == "2007-02-02")

subdta <- mutate(subdta, datetime = paste(Date, Time))
subdta$datetime <- anytime(as.factor(subdta$datetime))

#plot 2.
with(subdta, plot(x= datetime, y= as.numeric(levels(subdta$Global_active_power)[subdta$Global_active_power]), xlab = "", ylab = "Global Active Power (kilowatts)", type='l'))
dev.copy(png, file ="Plot 2.png")
dev.off()
