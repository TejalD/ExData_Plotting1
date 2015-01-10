data.frame<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
data.frame$DateTime <- as.POSIXct(paste(data.frame$Date, data.frame$Time), format="%d/%m/%Y %H:%M:%S")
data.frame$Date<-as.Date(data.frame$Date,"%d/%m/%Y")
input<-subset(data.frame,data.frame$Date=="2007-02-01" | data.frame$Date=="2007-02-02")

png(file="./plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(input, 
     {
     plot(DateTime,Global_active_power , xlab="",ylab="Global Active Power",type="s")
     plot(DateTime,Voltage, xlab="datetime",ylab="Voltage",type="s")
     plot(DateTime,Sub_metering_1, xlab="",ylab="Energy sub metering",type="n")
     lines(DateTime, Sub_metering_1 , col="Black")
     lines(DateTime, Sub_metering_2 , col="Red")
     lines(DateTime, Sub_metering_3 , col="Blue")
     legend("topright" ,bty = "n", cex=0.8,box.lwd=2,lty=1,col=c("Black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(DateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="s")
     }
  )
dev.off()

