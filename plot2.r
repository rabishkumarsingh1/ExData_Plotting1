variable.class <- c(rep('character',2),rep('numeric',7))
y <- read.table("household_power_consumption.txt",
    sep=";",
    col.names=c("Date", "Time", 
                "Global_active_power" ,
                "Global_reactive_power",
                "Voltage", "Global_intensity",
                "Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
    fill=FALSE,
    header = TRUE,
    na.strings='?',
    colClasses=variable.class) 

library(data.table)
library(lubridate)

y1 <- y[y$Date=='1/2/2007' | y$Date=='2/2/2007',]
y1$Date <- as.Date(y1$Date,"%d/%m/%Y")#remember capital "Y"
##y2DateTime <- as.POSIXct(paste(y1$Date,y1$Time),
##                          format="%Y-%m-%d %H:%M:%S")
##y1$Date <- weekdays(as.Date(y1$Date)) 

y1$DateTime <- ymd(y1$Date)+hms(y1$Time)


png(filename='plot2.png',width=480,height=480, units='px')

# plot data
plot(y1$DateTime,y1$Global_active_power,
     ylab='Global Active Power (kilowatts)',
     xlab='',type="l")

# close device
x<-dev.off() 

