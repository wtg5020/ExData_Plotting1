plot1Data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=2075259, check.names=FALSE, stringsAsFactors = FALSE, quote ='\"')

plot1DataFilter <- subset(plot1Data, Date %in% c("1/2/2007","2/2/2007"))

plot1DataFilter$Date <- as.Date(plot1DataFilter$Date, format="%d/%m/%Y")

hist(plot1DataFilter$Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab="Frequency")

dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()
