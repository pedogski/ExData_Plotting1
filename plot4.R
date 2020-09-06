#######################################################################
# Reading, naming and subsetting power consumption data
dataFile <- "./household_power_consumption.txt"
powerdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpowerData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
str(subpowerData)

datentime <- strptime(paste(subpowerData$Date, subpowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subpowerData$Global_active_power)

# initiating a composite plot with many graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datentime, globalActivePower, type="l", xlab="", col= "firebrick4", ylab="Global Active Power", cex=0.2)
plot(datentime,subpowerData$Sub_metering_1,type="n",xlab="", col= "darkorchid4", ylab="Energy sub metering")
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_1)), col= "gold4"))
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_2)),col="darkgoldenrod4"))
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_3)),col="brown1"))
legend("topright", lty=1, col=c("black","darkgoldenrod4","brown1"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datentime, as.numeric(as.character(subpowerData$Voltage)), type="l", xlab="datetime", ylab="Voltage", col = "deeppink4")

plot(datentime, as.numeric(as.character(subpowerData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power", col= "indianred4")
dev.off()



