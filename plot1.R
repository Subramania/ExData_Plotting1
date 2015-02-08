#Read the data and subset only the required
hpc<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc2<-subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

#include the data together with the time to make sure when converting the time, date is capture otherwise uses today's date
hpc2[,2]<-paste(hpc2[,1],hpc2[,2])

#convert to date & time
hpc2$Time<-strptime(x=hpc2$Time, "%d/%m/%Y %H:%M:%S")
hpc2$Date<-strptime(x=hpc2$Date, "%d/%m/%Y")

#Open PNG and pliot graph
png(filename="plot1.png")
hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turn dev off
dev.off()