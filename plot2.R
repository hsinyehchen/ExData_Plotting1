library(dplyr)

colcla <- c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

tbl <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings = "?", colClasses = colcla)
timedate <- paste(as.character(tbl$Date),as.character(tbl$Time))
tbl$TimeDate <- strptime(timedate, format = "%d/%m/%Y %T")
date_beg <- strptime("20070201",format = "%Y%m%d")
date_end <- strptime("20070203",format = "%Y%m%d")

tbl_feb <- tbl[tbl$TimeDate >= date_beg & tbl$TimeDate < date_end,]

png("plot2.png")
plot(tbl_feb$TimeDate,tbl_feb$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(tbl_feb$TimeDate,tbl_feb$Global_active_power)

dev.off()
