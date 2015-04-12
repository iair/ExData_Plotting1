#Proyect 1 EDA
#Run this part of the code only if you don´t have already install this package
install.packages("lubridate")
#This is the code to create the plot 1 wich is a Scatterplot of the Global 
#Active Power Varibale with the datetime
library(lubridate)
#Read the data
household_power_consumption <- read.csv(
        "~/R/exdata-data-household_power_consumption/household_power_consumption.txt", 
        sep=";", stringsAsFactors=FALSE)
#Transform the Date column from character to Date format
household_power_consumption$DateTime <- dmy_hms(paste(
        household_power_consumption$Date, household_power_consumption$Time))
household_power_consumption$Date<-as.Date(household_power_consumption$Date,
                                          "%d/%m/%Y")
#Transform the Date column from character to Date format
household_power_consumption<-subset(household_power_consumption,
                                    household_power_consumption$Date>="2007-02-01")
household_power_consumption<-subset(household_power_consumption,
                                    household_power_consumption$Date<="2007-02-02")
#Transform the Global active power variable to numeric
household_power_consumption$Global_active_power<-as.numeric(
        household_power_consumption$Global_active_power)
#Create the Scatterplot
with(household_power_consumption,plot(DateTime,Global_active_power,
                                      ylab="Global Active Power (kilowatts)",
                                      xlab="",type="l",col="black"))
#Code for copy a plot from a device to a png
dev.copy(png,file="plot2.png")
dev.off()