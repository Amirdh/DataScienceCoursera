library("dplyr")
library("lubridate")

hpc<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)), stringsAsFactors = FALSE)

hpcdate<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hpcdate<- mutate(hpcdate, DateTime = paste(Date, Time))
plot(dmy_hms(hpcdate$DateTime), hpcdate$Global_active_power,  pch= ".", type = "l", xlab = " ", ylab = "Global Active Power")
dev.copy(png, file= "plot2.png")
dev.off()

