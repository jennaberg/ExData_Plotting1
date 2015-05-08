#first plot code
#code for reading the data
df<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
library(dplyr)
df<-mutate(df, datetime=paste(Date, Time))
df$Date<-as.Date(df$Date, "%d/%m/%Y")
df2<-filter(df, Date=="2007-02-01" | Date=="2007-02-02")
df2$datetime<-strptime(df2$datetime, "%d/%m/%Y %H:%M:%S")

#now the code for creating a histogrom showing the frequency of each Global active power reading, in red, with a transparent background
png(filename="plot1.png", bg="transparent")
with(df2, hist( Global_active_power, xlab="Global Active Power (kilowats)", col="red", main=paste("Global Active Power"), ylim=range(c(0,1200)), xlim=range(c(0,6))))
dev.off()