## CodeBook

a code book for the plot1.R-plot4.R

###Script
4 scripts ploting 4 graphs of the project:
1. plot1.R: plot the histograms of Global Active Power.
2. plot2.R: plot the graph of Global Active Power.
3. plot3.R: plot the graph of Sub metering 1:3.
4. plot4.R: plot 4 graphs.

Each of the 4 scripts contains 3 parts
1. Read data.
2. Creat a png file and plot the graph.
3. Close the png device.

###Variables, Data and Transformations

####part1:

rawData: the raw data from the dates 2007-02-01 and 2007-02-02 of the household_power_consumption.txt(starts from 66638 and have 2880 rows).

colnames():changes the names of the rawData's columns.

dateTime: convert the Date and Time to date/time class,and the format is %d/%m/%Y %H:%M:%S.

data: the clean data of the project whose the first column is the date time and the rest is electric power consumption Data set.

####part2:

png(): creat a png files with a width of 480 pixels and a height of 480 pixels.
par(): set the graphical parameters.
plot(): plot the graphs.
lines(): add lines.
legend(): add legends.

####part3:

dev.off(): close the device of png.