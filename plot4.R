hpc<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc2<-subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

hpc2[,2]<-paste(hpc2[,1],hpc2[,2])


hpc2$Time<-strptime(x=hpc2$Time, "%d/%m/%Y %H:%M:%S")
hpc2$Date<-strptime(x=hpc2$Date, "%d/%m/%Y")

png(filename="plot4.png")
par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(hpc2$Time, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(hpc2$Time, hpc2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(hpc2$Time, hpc2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(hpc2$Time, hpc2$Sub_metering_2, col="red", type="l")
points(hpc2$Time, hpc2$Sub_metering_3, col="blue", type="l")
par(font=5)
legend("topright", bty="n", pch=190, col = c("black", "red", "blue"), text.font=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
par(font=1)
plot(hpc2$Time, hpc2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

