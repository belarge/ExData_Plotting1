ElectricalData <- read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
#Date Conversions
ElectricalData$Date <- as.Date(ElectricalData$Date,"%d/%m/%Y")
#Subset by Date
wantedElectricalData <- subset(ElectricalData, ElectricalData$Date >= as.Date("01/02/2007","%d/%m/%Y") & ElectricalData$Date <= as.Date("02/02/2007","%d/%m/%Y"))

#Data Cleanups
wantedElectricalData$Datetime <- strptime(paste(wantedElectricalData$Date, wantedElectricalData$Time), "%Y-%m-%d %H:%M:%S")
wantedElectricalData$Global_active_power <- as.numeric(wantedElectricalData$Global_active_power)
wantedElectricalData$Global_reactive_power <- as.numeric(wantedElectricalData$Global_reactive_power)
wantedElectricalData$Voltage <- as.numeric(wantedElectricalData$Voltage)
wantedElectricalData$Global_intensity <- as.numeric(wantedElectricalData$Global_intensity)
wantedElectricalData$Sub_metering_1 <- as.numeric(wantedElectricalData$Sub_metering_1)
wantedElectricalData$Sub_metering_2 <- as.numeric(wantedElectricalData$Sub_metering_2)
wantedElectricalData$Sub_metering_3 <- as.numeric(wantedElectricalData$Sub_metering_3)
#End Common Code

#Plot Specific Code
png("Plot4.png")
par(mfrow=c(2,2))

#Plot 1

plot(wantedElectricalData$Datetime,wantedElectricalData$Global_active_power,type="n",ylab="Global Active Power", xlab="")
lines(wantedElectricalData$Datetime,wantedElectricalData$Global_active_power,type="l")

#Plot 2

plot(wantedElectricalData$Datetime,wantedElectricalData$Voltage,type="n",ylab="Voltage", xlab="datetime")
lines(wantedElectricalData$Datetime,wantedElectricalData$Voltage,type="l")

#Plot 3

plot(wantedElectricalData$Datetime,wantedElectricalData$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
lines(wantedElectricalData$Datetime,wantedElectricalData$Sub_metering_1,type="l")
lines(wantedElectricalData$Datetime,wantedElectricalData$Sub_metering_2,type="l",col="red")
lines(wantedElectricalData$Datetime,wantedElectricalData$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1), bty="n")

#plot 4

plot(wantedElectricalData$Datetime,wantedElectricalData$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(wantedElectricalData$Datetime,wantedElectricalData$Global_reactive_power,type="l")

dev.off()
