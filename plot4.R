library(data.table)
exdata <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, dec=".")
exdata$Date<-as.Date(exdata$Date, "%d/%m/%Y")
exdata <- subset(exdata, exdata$Date=="2007-02-01" | exdata$Date=="2007-02-02")
attach(exdata)
time<- paste(Date, Time, sep=" ")
time<- strptime(time, "%Y-%m-%d %T")
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(time, Global_active_power, type = "n", xlab="", ylab="Global Active Power")
lines(time, Global_active_power)

plot(time, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(time, Sub_metering_1)
lines(time, Sub_metering_2, col="red")
lines(time, Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

plot(time, Voltage, type = "n", xlab="datetime", ylab="Voltage")
lines(time, Voltage)

plot(time, Global_reactive_power, type = "n", xlab="datetime")
lines(time, Global_reactive_power)

dev.off()