#Reading data
household_power_consumption <- read.csv("~/Documents/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption <- household_power_consumption[household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007', ]
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Converting date and time into a single column
household_power_consumption$Datetime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")

#Plotting plot3.png
png('plot3.png')
plot(household_power_consumption$Datetime,household_power_consumption$Sub_metering_1, type = 'lines', xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$Datetime,household_power_consumption$Sub_metering_2, type = 'lines', col = "red")
lines(household_power_consumption$Datetime,household_power_consumption$Sub_metering_3, type = 'lines', col = "blue")
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1), lwd=c(1) ,col = c("black", "red", "blue"))
dev.off()