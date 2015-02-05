hpc<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc2<-subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

hpc2[,2]<-paste(hpc2[,1],hpc2[,2])


hpc2$Time<-strptime(x=hpc2$Time, "%d/%m/%Y %H:%M:%S")
hpc2$Date<-strptime(x=hpc2$Date, "%d/%m/%Y")

png(filename="plot2.png")
plot(hpc2$Time, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

