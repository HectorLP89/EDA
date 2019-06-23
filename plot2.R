#Gráfica 2

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
png(paste(ruta,"plot2.png",sep=""), width=480, height=480)
plot(bd$Time,as.numeric(as.character(bd$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)", main = "Global Active Power Vs Time") 
dev.off()

