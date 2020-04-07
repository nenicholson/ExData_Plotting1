setwd('/Users/NatashaNicholson/Documents/R/ex')
library(dplyr)
data <- tbl_df(read.table('household_power_consumption.txt', sep=';', header=TRUE)) %>%
  mutate(DateTime=paste(Date,Time)) %>%
  mutate(DateTime=as.POSIXct(DateTime, format="%d/%m/%Y %H:%M")) %>%
  filter(as.Date(DateTime)==as.Date("2007-02-01") | as.Date(DateTime)==as.Date("2007-02-02")) %>%
  mutate(Global_Active_Power_kw=as.numeric(as.character(Global_active_power)))
data[data == "?"] <- NA
png("plot2.png")
with(data, plot(DateTime, Global_Active_Power_kw, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
axis(2, seq(0,6,2))
dev.off()
