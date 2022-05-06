## Read the input ffile
powerdata <- read.table("household_power_consumption.txt",
                        header = TRUE,na.strings = "?",sep = ";")

## Getting data for 2 days in February 
power_filtered <- subset(powerdata,powerdata$Date== "1/2/2007" |
                           powerdata$Date=="2/2/2007")

## Creating PNG file as device to plot wih height and width as 480

png(filename = "plot1.png",height = 480,width = 480)

## Creating the histogram for Global Active Power

hist(as.numeric(power_filtered$Global_active_power),col = "red",
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

## Closing the device
dev.off()