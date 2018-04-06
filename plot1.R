#read the table
read_file<-read.table("household_power_consumption.txt",header=FALSE,sep=";")

#convert the date and time columns to date/time classes
read_file$V1<-as.Date(read_file$V1,format="%d/%m/%Y")
read_file$V2<-strptime(read_file$V2,format="%H:%M:%S")


#Take the data only between 01-02-2007 and 02-02-2007

subsetdata<-subset(read_file, read_file$V1 == "2007-02-01"|read_file$V1=="2007-02-02")
subsetdata$V3<-as.numeric(subsetdata$V3)

#plot the graph
png(file="plot1.png",width=480,height=480)
hist(subsetdata$V3,col="red",main = "Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency") 
dev.off()
