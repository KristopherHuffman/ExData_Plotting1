
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
        date = as.Date(Date,"%d/%m/%Y") # make date class variable
    ) %>%
    filter(date %in% c("2007-02-01","2007-02-02"))

# Generate plot
png(filename = "./output/plot1.png",width = 480, height = 480)

with(feb,
    hist(as.numeric(Global_active_power),col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
)

dev.off()

