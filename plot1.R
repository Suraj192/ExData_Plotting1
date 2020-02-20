library(dplyr)
library(anytime)
library(microbenchmark)
our_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
our_data$Date <- as.Date(our_data$Date, format = "%d/%m/%Y")
subdta <- subset(our_data, Date == "2007-02-01" | Date == "2007-02-02")

#plot 1.
hist(as.numeric(levels(subdta$Global_active_power)[subdta$Global_active_power]) , main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file="Plot1.png")
dev.off()
