png(file="plot4.png")
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrow=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
            "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings="NA")
good<-complete.cases(data)
data1<-data[good,]
data1$Date<-as.character(data1$Date)
data1$Time<-as.character(data1$Time)
datetime<-as.POSIXct(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y %H:%M:%S'))
data2<-cbind(data1,datetime)
  par(mfrow=c(2,2))
with(data2,{
  plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(datetime,Sub_metering_1,col="black",ylab="Energy sub metering",xlab="",type="l")
    lines(datetime,Sub_metering_2,col="red")
    lines(datetime,Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c("black","red","blue"))
  plot(datetime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
})
dev.off()