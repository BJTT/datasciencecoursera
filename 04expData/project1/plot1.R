# Course Project 1 of Exploratory Data Analysis of Coursera
# This assignment uses data from the UC Irvine Machine Learning Repository
# The overall goal here is simply to examine 
# how household energy usage varies over a 2-day period in February, 2007. 
# The task is to reconstruct the plots, 
# all of which were constructed using the base plotting system.
# plot1/4

# read data: 1/2/2007 and 2/2/2007
rawData<-read.table("household_power_consumption.txt",sep=";",nrows=2880,skip=66637)
# column names
colnames(rawData)<-read.table("household_power_consumption.txt",sep=";",nrows=1,colClasses = "character")
# convert the Date and Time
dateTime<-strptime(paste(rawData[,"Date"],rawData[,"Time"]), "%d/%m/%Y %H:%M:%S")
data<-cbind(dateTime,rawData[,c(-1,-2)])

# plot1/4: histograms of Global Active Power
# plot to the png file 480*480
png("plot1.png", width = 480, height = 480)

par(bg="transparent")
hist(data[,"Global_active_power"],col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
 
# close the device
dev.off() 




