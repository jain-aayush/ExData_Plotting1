#plot histogram of Global Active Power

#read the data from the file
df <- read.delim('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?', 
                 colClasses =c(rep('character',2), rep('numeric',5)))
#convert date and time columns from Character to the respective data types
df$Date <- as.Date(df$Date)
df$Time <- strptime(df$Time, format = "%H:%M:%S")
#open png file
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
#plot the histogram
hist(df$Global_active_power,xlab = 'Gloabl Active Power (kilowatt)', main = 'Global Active Power',col = 'red')
#close and save the file
dev.off()