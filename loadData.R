## Read data from file
epcon <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?", nrows = 2075259)

## Convert epcon$Date to date
epcon$Date <- as.Date(epcon$Date, format="%d/%m/%Y")

## Extract data from the dates 2007-02-01 and 2007-02-02
epcondata <- subset(epcon, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert the Date and Time variables to Date/Time
datetime <- paste(as.Date(epcondata$Date), epcondata$Time)
epcondata$Datetime <- as.POSIXct(datetime)

