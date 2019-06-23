#Gráfica 3

ruta <- "C:/Users/Documents/R/"

#Leyendo datos
datos <- read.table(paste(ruta,"household_power_consumption.txt",sep=""),sep=";",header=TRUE)

#Tomando los días necesarios
bd <- subset(datos,datos$Date=="1/2/2007" | datos$Date =="2/2/2007")

#dando formato
bd$Date <- as.Date(bd$Date, format="%d/%m/%Y")
bd$Time <- strptime(bd$Time, format="%H:%M:%S")
bd[1:1440,"Time"] <- format(bd[1:1440,"Time"],"2007-02-01 %H:%M:%S")
bd[1441:2880,"Time"] <- format(bd[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#graficando
png(paste(ruta,"plot3.png",sep=""), width=480, height=480)
plot(bd$Time,bd$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="Energy sub-metering")
with(bd,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(bd,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(bd,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

