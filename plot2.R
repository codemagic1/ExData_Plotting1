file <- paste(getwd(), "/household_power_consumption.txt", sep = "")
data <- read.table(file, header = FALSE, sep = ";", skip = 66637, nrows = 2880, na.strings = "?", stringsAsFactors = FALSE)
data <- data[complete.cases(data), ]
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
library(dplyr)
data <- mutate(data, DateTime = paste(Date, Time))
data <- select(data, DateTime, Global_active_power:Sub_metering_3)
plot(strptime(data$DateTime, "%d/%m/%Y %H:%M:%S"), data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()