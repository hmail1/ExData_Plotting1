png(file="plot1.png")
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",skip=66637,nrow=2880,
col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
            "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings="NA")
good<-complete.cases(data)
data1<-data[good,]
data1$Date<-as.character(data1$Date)
data1$Time<-as.character(data1$Time)
datetime<-as.POSIXct(strptime(paste(data1$Date,data1$Time),format='%d/%m/%Y %H:%M:%S'))
data2<-cbind(data1,datetime)
hist(data[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()