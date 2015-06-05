hpc<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(rep("character",2), rep("numeric",7)), stringsAsFactors = FALSE)

hpcdate<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007" ),]
hist(hpcdate$Global_active_power, xlab = "Global Active Power(kilowatts)", col = "red")
dev.copy(png, file= "plot1.png")
dev.off()