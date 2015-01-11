## Read data from file
epcon <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)

## Convert epcon$Date to date
epcon$Date <- as.Date(epcon$Date, format="%d/%m/%Y")

## Extract data from the dates 2007-02-01 and 2007-02-02
epcondata <- subset(epcon, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert the Date and Time variables to Date/Time
datetime <- paste(as.Date(epcondata$Date), epcondata$Time)
epcondata$Datetime <- as.POSIXct(datetime)


## Plot graph to screen device
with(epcondata, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save graph to png file
dev.copy(png, file="plot3.png", height=480, width=480)

## close print device (PNG file)  
dev.off()

