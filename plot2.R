# Course project 1, plot 2

# Read the header row 
headers <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, nrows=1)
headers <- as.character(headers[1,])

# Read in rows for the dates 2007-02-01 and 2007-02-02
twoDays = 60 * 24 * 2
data <- read.table("./household_power_consumption.txt", sep=";", col.names=headers, skip=66637, nrows=twoDays)

# Convert the dates to POSIXlt
data$DateParsed <- strptime(data$Date, format="%d/%m/%Y")
data$WeekDay <- weekdays(data$DateParsed)

png("plot2.png", width=480, height=480)

plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
axis(side=1, at=c(1,1441, 2881), labels=c("Thu", "Fri", "Sat"))

dev.off()