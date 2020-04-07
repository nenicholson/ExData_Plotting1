setwd('/Users/NatashaNicholson/Documents/R/ex')
library(dplyr)
data <- tbl_df(read.table('household_power_consumption.txt', sep=';', header=TRUE)) %>%
  mutate(DateTime=paste(Date,Time)) %>%
  mutate(DateTime=as.POSIXct(DateTime, format="%d/%m/%Y %H:%M")) %>%
  filter(as.Date(DateTime)==as.Date("2007-02-01") | as.Date(DateTime)==as.Date("2007-02-02")) %>%
  mutate(Global_Active_Power_kw=as.numeric(as.character(Global_active_power))) 
data[data == "?"] <- NA
png("plot3.png")
with(data, plot(DateTime, as.numeric(as.character(Sub_metering_1)), type = "l", xlab="", ylab=""))
with(data, lines(DateTime, as.numeric(as.character(Sub_metering_2)), col="red"))
with(data, lines(DateTime, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
title(xlab="", ylab="Energy sub metering")
dev.off()
