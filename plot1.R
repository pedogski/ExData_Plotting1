setwd("C:/Users/HP/OneDrive/Documents/R/coursera/EDA/New folder")

dataFile <- "./household_power_consumption.txt"
powerdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subpowerData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
str(subpowerData)
## convert golbalActivePower to numeric as it is recorded as character
globalActivePower <- as.numeric(subpowerData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="chocolate", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

