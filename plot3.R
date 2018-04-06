#read the table
read_file<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#Take the data only between 01-02-2007 and 02-02-2007
subsetdata<-subset(read_file,Date %in% c("1/2/2007","2/2/2007"))
#convert the date and time columns to date/time classes
#subsetdata$Date<-format="%d/%m/%Y"


date_time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(date_time, submetering1, type="l", xlab="", ylab="Energy Sub Metering")
lines(date_time,submetering2,type="l",col="red")
lines(date_time,submetering3,type="l",col="blue")
legend("topright",c("Sub_Metering_1","Sub_Metering_2","sub_Metering_3"),lty=5, lwd=2.5,col=c("black","red","blue"))
dev.off()
