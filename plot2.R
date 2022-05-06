## Read the input ffile
powerdata <- read.table("household_power_consumption.txt",
                        header = TRUE,na.strings = "?",sep = ";")

## Getting data for 2 days in February 
power_filtered <- subset(powerdata,powerdata$Date== "1/2/2007" |
                           powerdata$Date=="2/2/2007")

## Creating PNG file as device to plot wih height and width as 480

png(filename = "plot2.png",height = 480,width = 480)

power_filtered$Date <- as.Date(power_filtered$Date,format = "%d/%m/%Y") 
power_filtered$Time <- strptime(power_filtered$Time,format = "%H:%M:%S")

power_filtered[1:1440,"Time"] <- format(power_filtered[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_filtered[1441:2880,"Time"] <- format(power_filtered[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(power_filtered$Time,as.numeric(as.character(power_filtered$Global_active_power))
     ,type = "l",xlab = "",
     ylab = "Global Active Power(kilowatts)",
     main = "Global Active Power Vs Time")
## Closing the device
dev.off()