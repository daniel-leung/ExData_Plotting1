plot1 <- function(powerf) {
power<-read.table(powerf,header=TRUE,sep=";",na.strings="?")
ps<-(subset(power,(power$Date=="2/2/2007" | power$Date=="1/2/2007")))
library(lubridate)
ps$DT<-dmy_hms(paste(ps$Date,ps$Time))
par(mar = c(4,4,2,1), mfrow=c(1,1))
with(ps,hist(Global_active_power,col="red",
             main="Global Active Power",
             xlab="Global Active Power(kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()
}
