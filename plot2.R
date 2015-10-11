plot2 <- function(powerf) {
  power<-read.table(powerf,header=TRUE,sep=";",na.strings="?")
  ps<-(subset(power,(power$Date=="2/2/2007" | power$Date=="1/2/2007")))
  library(lubridate)
  ps$DT<-dmy_hms(paste(ps$Date,ps$Time))
  par(mar = c(4,4,2,1),mfrow=c(1,1))
  with(ps,plot(DT,Global_active_power,
               ylab="Global Active Power(kilowatts)",xlab=" ",type="n"))
  lines(ps$DT,ps$Global_active_power)
  dev.copy(png, file = "plot2.png")
  dev.off()
}