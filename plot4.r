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

y1$DateTime <- ymd(y1$Date)+hms(y1$Time)

png(filename='plot4.png',width=480,height=480, units='px')

# plot data
par(mfrow = c(2, 2))
with ( y1, {
  plot(y1$DateTime,y1$Global_active_power,
       ylab='Global Active Power',
       xlab='',type="l")
  
  plot(y1$DateTime,y1$Voltage,
       ylab='Voltage',
       xlab='datetime',col="black",type="l")
  
  plot(y1$DateTime,y1$Sub_metering_1,
       ylab='Energy sub metering',
       xlab='',col="black",type="l")
  lines(y1$DateTime,y1$Sub_metering_2, col="red")
  lines(y1$DateTime,y1$Sub_metering_3, col="blue")
  legend("topright", pch = 20,lty="solid", col = c("blue", "red"),
         legend = c("Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3")) 
  
  plot(y1$DateTime,y1$Global_reactive_power,
       ylab='Global_reactive_power',
       xlab='datetime',col="black",type="l")
  } )
# close device
x<-dev.off() 


