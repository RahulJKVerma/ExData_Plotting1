#Reading data
household_power_consumption <- read.csv("~/Documents/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
household_power_consumption <- household_power_consumption[household_power_consumption$Date == '1/2/2007' | household_power_consumption$Date == '2/2/2007', ]
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

#Converting date and time into a single column
household_power_consumption$Datetime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")


#Plotting histogram
png('plot1.png')
hist(household_power_consumption$Global_active_power, breaks=12, col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
