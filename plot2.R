
library(tidyverse)
source('./Command Center/functionLibrary.R')

# Set working dir
setwd("./Data Science Specialization/Exploratory Data Analysis/Course Project 1")

# Download data
downloadurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
getZipFile(downloadurl) # custom function to download and extract zip file

# Read data
house <- read.table("./data/household_power_consumption.txt",head=T,sep=';')

# Subset data
feb <- house %>%
    mutate(
        date = as.Date(Date,"%d/%m/%Y"), # date class variable
        datetime = paste(Date,Time,sep="-"),
        time = strptime(datetime,format="%d/%m/%Y-%H:%M:%S") # time class variable
    ) %>%
    filter(date %in% c("2007-02-01","2007-02-02"))

# Generate plot
png(filename = "./output/plot2.png",width = 480, height = 480)

with(feb, {
    plot(time,Global_active_power,type='l',xaxt='n',xlab='',ylab='Global Active Power (kilowatts)')
    
    # Use weekday as axis tick
    # Note the use of as.POSIXct() 
    axis(1,
         seq(from=as.POSIXct("2007/02/01"),to=as.POSIXct("2007/02/03"),by="day"),
         format(seq(from=as.POSIXct("2007/02/01"),to=as.POSIXct("2007/02/03"),by="day"), "%a")
    )
})

dev.off()




