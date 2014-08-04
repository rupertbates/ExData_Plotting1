# Course project 1, plot 1

# Read the header row 
headers <- read.table("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, nrows=1)
headers <- as.character(headers[1,])

# Read in rows for the dates 2007-02-01 and 2007-02-02
twoDays = 60 * 24 * 2
data <- read.table("./household_power_consumption.txt", sep=";", col.names=headers, skip=66637, nrows=twoDays)

# Convert the dates to POSIXlt
data$DateParsed <- strptime(data$Date, format="%d/%m/%Y")

hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png") 
dev.off()
