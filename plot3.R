## Read the input ffile
powerdata <- read.table("household_power_consumption.txt",
                        header = TRUE,na.strings = "?",sep = ";")

## Getting data for 2 days in February 
power_filtered <- subset(powerdata,powerdata$Date== "1/2/2007" |
                           powerdata$Date=="2/2/2007")

## Creating PNG file as device to plot wih height and width as 480

png(filename = "plot3.png",height = 480,width = 480)

power_filtered$Date <- as.Date(power_filtered$Date,format = "%d/%m/%Y") 
power_filtered$Time <- strptime(power_filtered$Time,format = "%H:%M:%S")

power_filtered[1:1440,"Time"] <- format(power_filtered[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_filtered[1441:2880,"Time"] <- format(power_filtered[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


##Basic plot functions

plot(power_filtered$Time, power_filtered$Sub_metering_1,type = "n",xlab = "",
     ylab = "Energy Sub Metering")
with(power_filtered, lines(Time,Sub_metering_1))
with(power_filtered,lines(Time,Sub_metering_2,col = "red"))
with(power_filtered,lines(Time,Sub_metering_3,col = "blue"))
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))

## Closing the device
dev.off()