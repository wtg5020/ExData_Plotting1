plot4Data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=FALSE, stringsAsFactors = FALSE, quote ='\"')

plot4DataFilter <- subset(plot4Data, Date %in% c("1/2/2007","2/2/2007"))

plot4DataFilter$Date <- as.Date(plot4DataFilter$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(plot4DataFilter$Date), plot4DataFilter$Time)

plot4DataFilter$Datetime <- as.POSIXct(datetime)


png(filename = "plot4.png", width = 480, height = 480 )

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(plot4DataFilter, {
  plot(Global_active_power~Datetime, type="l",
       xlab="", ylab="Global Active Power")
  plot(Voltage~Datetime, type="l",
       xlab="dateime", ylab="Voltage")
  with(plot4DataFilter, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col="Red")
    lines(Sub_metering_3~Datetime,col="Blue")
  })
  
  legend("topright", col=c("black","red","blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
          xlab="datetime", ylab="Global Reactive Power")
  
  })

dev.off()
