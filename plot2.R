#read the table
read_file<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Take the data only between 01-02-2007 and 02-02-2007
subsetdata<-subset(read_file, Date %in% c("1/2/2007","2/2/2007"))
#convert the date and time columns to date/time classes
#subsetdata$Date<-as.Date(subsetdata$Date,format="%d/%m/%Y")


date_time <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
