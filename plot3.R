#Energy submetering 

#read the data from the file
df <- read.delim('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?', 
                 colClasses =c(rep('character',2), rep('numeric',5)))
#convert date and time columns from Character to the respective data types
df$DateTime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")
df <- subset(df, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))
#open png file
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(df$DateTime, df$Sub_metering_1, type = "n", ylab = 'Energy sub metering', xlab = "")
lines(df$DateTime,df$Sub_metering_1)
lines(df$DateTime, df$Sub_metering_2, col  = 'red')
lines(df$DateTime, df$Sub_metering_3, col  = 'blue')
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lwd = 3, col = c('black','red','blue'))
dev.off()