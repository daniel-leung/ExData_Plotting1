plot4 <- function(powerf) {
  power<-read.table(powerf,header=TRUE,sep=";",na.strings="?")
  ps<-(subset(power,(power$Date=="2/2/2007" | power$Date=="1/2/2007")))
  library(lubridate)
  ps$DT<-dmy_hms(paste(ps$Date,ps$Time))
  par(mar = c(4,4,2,1), mfcol = c(2,2))
  #
  # Global Active Power vs Date/Time
  #
  with(ps,plot(DT,Global_active_power,
  ylab="Global Active Power(kilowatts)",xlab=" ",type="l"))
  # lines(ps$DT,ps$Global_active_power)
  #
  # Energy Submetering vs Date/Time
  #
  with(ps,plot(DT,Sub_metering_1, ylab="Enery Submetering",
        xlab=" ",type="l"))
  with(ps,lines(DT,Sub_metering_2, col="red"))
  with(ps,lines(DT,Sub_metering_3, col="green"))
  legend("topright",col = c("black", "red","green"), 
        legend = c("Submetering 1", "Submetering 2","Submetering 3"),
        lty=c(1,1,1),cex=0.5)
  # #
  # Voltage vs DateTime
  #
  with(ps,plot(DT,Voltage, ylab="Voltage",xlab="datetime ",type="l"))
  #
  # Global Reactive Power vs DateTime 
  #
  with(ps,plot(DT,Global_reactive_power,xlab="datetime ",type="l"))
  #
  # Output to png device
  #
  dev.copy(png, file = "plot4.png")
  dev.off()
}
