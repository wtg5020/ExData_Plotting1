plot3Data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=FALSE, stringsAsFactors = FALSE, quote ='\"')

plot3DataFilter <- subset(plot3Data, Date %in% c("1/2/2007","2/2/2007"))

plot3DataFilter$Date <- as.Date(plot3DataFilter$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3DataFilter$Date), plot3DataFilter$Time)

plot3DataFilter$Datetime <- as.POSIXct(datetime)

png(filename = "plot3.png", width = 480, height = 480 )

with(plot3DataFilter, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col="Red")
  lines(Sub_metering_3~Datetime,col="Blue")
})

legend("topright", col=c("black","red","blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


dev.off()




