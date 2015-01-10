data.frame<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
data.frame$DateTime <- as.POSIXct(paste(data.frame$Date, data.frame$Time), format="%d/%m/%Y %H:%M:%S")
data.frame$Date<-as.Date(data.frame$Date,"%d/%m/%Y")
input<-subset(data.frame,data.frame$Date=="2007-02-01" | data.frame$Date=="2007-02-02")

png(file="./plot3.png", width = 480, height = 480)

plot(input$DateTime,input$Sub_metering_1,type="n" ,ylab="Energy sub metering",xlab="")
lines(input$DateTime, input$Sub_metering_1 , col="Black")
lines(input$DateTime, input$Sub_metering_2 , col="Red")
lines(input$DateTime, input$Sub_metering_3 , col="Blue")

legend("topright" ,lty = 1,col=c("Black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()