# Reading, naming and subsetting power consumption data
dataFile <- "./household_power_consumption.txt"
powerdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpowerData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
str(subpowerData)

datentime <- strptime(paste(subpowerData$Date, subpowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subpowerData$Global_active_power)

# calling the basic plot functions
png("plot3.png", width=480, height=480)
plot(datentime,subpowerData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_1))))
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_2)),col="darkgoldenrod4"))
with(subpowerData,lines(datentime,as.numeric(as.character(Sub_metering_3)),col="brown1"))
legend("topright", lty=1, col=c("black","darkgoldenrod4","brown1"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")
dev.off()
