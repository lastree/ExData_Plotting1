Sys.setlocale("LC_TIME","en_US.UTF-8")

A <- read.table("household_power_consumption.txt",head=T,sep=";",stringsAsFactors=F)
A$Date <- as.Date(A$Date,"%d/%m/%Y")

B <- subset(A,A$Date>="2007-02-01" & A$Date<="2007-02-02")
B$Sub_metering_1 <- as.numeric(B$Sub_metering_1)
B$Sub_metering_2 <- as.numeric(B$Sub_metering_2)
B$Sub_metering_3 <- as.numeric(B$Sub_metering_3)
B$temp <- strptime(paste(B$Date,B$Time),"%Y-%m-%d %H:%M:%S")

png(filename="plot3.png",width=480, height=480, units ="px")
plot(B$temp, B$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(B$temp, B$Sub_metering_2, col="red")
lines(B$temp, B$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()
