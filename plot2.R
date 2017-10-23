plot2Data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=FALSE, stringsAsFactors = FALSE, quote ='\"')

plot2DataFilter <- subset(plot2Data, Date %in% c("1/2/2007","2/2/2007"))

plot2DataFilter$Date <- as.Date(plot2DataFilter$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(plot2DataFilter$Date), plot2DataFilter$Time)

plot2DataFilter$Datetime <- as.POSIXct(datetime)

plot(plot2DataFilter$Global_active_power~plot2DataFilter$Datetime,type="l",xlab=
       "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()
