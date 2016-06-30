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

#y$Global_active_power <-as.numeric(as.character
#                                   (y$Global_active_power))
#y$Date <- as.Date(as.character(y$Date))

y1 <- y[y$Date=='1/2/2007' | y$Date=='2/2/2007',]
y1$Date <- as.Date(y1$Date,"%d %m %Y")

## first graph 
png(filename='plot1.png',width=480,height=480, units='px')
hist(y1$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red",
     main = "Global Active Power")
dev.off()  