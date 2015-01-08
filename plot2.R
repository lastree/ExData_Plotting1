Sys.setlocale("LC_TIME","en_US.UTF-8")

A <- read.table("household_power_consumption.txt",head=T,sep=";",stringsAsFactors=F)
A$Date <- as.Date(A$Date,"%d/%m/%Y")

B <- subset(A,A$Date>="2007-02-01" & A$Date<="2007-02-02")
B$Global_active_power <- as.numeric(B$Global_active_power)
B$temp <- strptime(paste(B$Date,B$Time),"%Y-%m-%d %H:%M:%S")

png(filename="plot2.png",width=480, height=480, units ="px")
plot(B$temp, B$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
