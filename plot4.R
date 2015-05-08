#fourth plot code
#code for reading the data
df<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
library(dplyr)
df<-mutate(df, datetime=paste(Date, Time))
df$Date<-as.Date(df$Date, "%d/%m/%Y")
df2<-filter(df, Date=="2007-02-01" | Date=="2007-02-02")
df2$datetime<-strptime(df2$datetime, "%d/%m/%Y %H:%M:%S")

#code for creating the fourth plot : a four fold plot showing time-series of the data over the two days in question
png(filename="plot4.png", bg="transparent")
par(mfrow=c(2,2))          
#that will put things along in rows
with(df2, plot(datetime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowats)"))
with(df2, plot(datetime, Voltage, type="l"))
with(df2, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ", ylim=range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
par(new=TRUE)
with(df2, plot(datetime, Sub_metering_2, type="l", ylab=" ", xlab=" ", col="red", ylim=range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
par(new=TRUE)
with(df2, plot(datetime, Sub_metering_3, type="l", ylab=" ", xlab=" ", col="blue", ylim=range(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
legend("topright", col=c("black", "red", "blue"), legend=c("sub metering 1", "sub metering 2", "sub metering 3"), lwd=2)
with(df3, plot(DateTime, Global_reactive_power, type="l"))
dev.off()