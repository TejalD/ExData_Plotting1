data.frame<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?",stringsAsFactors = FALSE)
data.frame$DateTime <- as.POSIXct(paste(data.frame$Date, data.frame$Time), format="%d/%m/%Y %H:%M:%S")
data.frame$Date<-as.Date(data.frame$Date,"%d/%m/%Y")
input<-subset(data.frame,data.frame$Date=="2007-02-01" | data.frame$Date=="2007-02-02")

plot(input$DateTime, input$Global_active_power ,type="n", ylab="Global Active Power(kilowatts)", xlab="")
#plot() defaults to day of the week when plotting date/times.
lines(input$DateTime, input$Global_active_power)
dev.copy(png,file="./plot2.png",width = 480, height = 480)
dev.off()