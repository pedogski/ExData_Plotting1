dataFile <- "./household_power_consumption.txt"
Powerdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersub<- powerdata[Powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datentime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powersub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datentime, globalActivePower, type="l", col= "cadetblue4", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
