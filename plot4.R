#Gráfica 4

ruta <- "C:/Users/Documents/R/"

#Leyendo datos
datos <- read.table(paste(ruta,"household_power_consumption.txt",sep=""),sep=";",header=TRUE)

#Tomando los días necesarios
bd <- subset(datos,datos$Date=="1/2/2007" | datos$Date =="2/2/2007")

#dando formato
datetime <- strptime(paste(bd$Date, bd$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(bd$Global_active_power)
globalReactivePower <- as.numeric(bd$Global_reactive_power)
voltage <- as.numeric(bd$Voltage)
subMetering1 <- as.numeric(bd$Sub_metering_1)
subMetering2 <- as.numeric(bd$Sub_metering_2)
subMetering3 <- as.numeric(bd$Sub_metering_3)

#graficando
png(paste(ruta,"plot4.png",sep=""), width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()