#reading file
colNames<- names(read.table("household_power_consumption.txt", nrows=1, sep=";",header=TRUE))
Lines = readLines("household_power_consumption.txt")
df <- read.table("household_power_consumption.txt", sep=";", na.strings = "?",
                 header=FALSE, col.names=colNames,
                 skip = grep("1/2/2007",Lines)[1]-1,
                 nrows = grep("3/2/2007",Lines)[1]-grep("1/2/2007",Lines)[1]
)
#converting data and time
df$newdate <- as.Date(df$Date, "%d/%m/%Y")
df$newtime <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
#plotting and saving png 
hist(df$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, "Plot1.png")
dev.off()