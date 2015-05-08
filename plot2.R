#second plot code
#code for reading the data
df<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
library(dplyr)
df<-mutate(df, datetime=paste(Date, Time))
df$Date<-as.Date(df$Date, "%d/%m/%Y")
df2<-filter(df, Date=="2007-02-01" | Date=="2007-02-02")
df2$datetime<-strptime(df2$datetime, "%d/%m/%Y %H:%M:%S")

#now the code to make the second plot: a time series of the GLobal active power readings for the two days in question (with a transparent background)
png(filename="plot2.png", bg="transparent")
with(df2, plot(datetime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowats)"))          
dev.off()
