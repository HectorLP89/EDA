#Gráfica 1

ruta <- "C:/Users/Documents/R/"

#Leyendo datos
datos <- read.table(paste(ruta,"household_power_consumption.txt",sep=""),sep=";",header=TRUE)

#Tomando los días necesarios
bd <- subset(datos,datos$Date=="1/2/2007" | datos$Date =="2/2/2007")

#histograma

png(paste(ruta,"plot1.png",sep=""), width=480, height=480)
hist(as.numeric(as.character(bd$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

