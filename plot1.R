
A <- read.table("household_power_consumption.txt",head=T,sep=";",stringsAsFactors=F)
A$Date <- as.Date(A$Date,"%d/%m/%Y")

B <- subset(A,A$Date>="2007-02-01" & A$Date<="2007-02-02")
B$Global_active_power <- as.numeric(B$Global_active_power)

png(filename="plot1.png",width=480, height=480, units ="px")
hist(B$Global_active_power,col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()


