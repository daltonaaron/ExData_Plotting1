##Exploritory Data Analysis
## Aaron Dalton
##7/9/2015

##Electric Power consumption



##Check Path and Make sure the Data is in one folder##

getwd()
setwd("C:/Users/VHAPALDALTOA/Downloads/Power")


##read in the data

    electricpower<- read.table("household_power_consumption.txt" ,sep = ";",header= TRUE )
head(electricpower)

##Subset the data

EPSubset <- electricpower[electricpower$Date %in% c("1/2/2007","2/2/2007") ,]
head(EPSubset)


EPSubset$Global_active_power <- as.numeric(as.character(EPSubset$Global_active_power))




#####################################################################

windows()
hist(EPSubset$Global_active_power, 
     main = paste("Global Active Power"), 
     col="red", 
     xlab="Global Active Power (kilowatts)"
     )
  


dev.copy(png, 
         file="plot1.png", 
         width=480, 
         height=480
         )

  dev.off()


##############################################################################################

EPSubset$Datetime <- strptime(paste(EPSubset$Date, EPSubset$Time), "%d/%m/%Y %H:%M:%S")
head(EPSubset)


windows()
plot(EPSubset$Datetime, EPSubset$Global_active_power,  
 type="l", 
  xlab="", 
  ylab="Global Active Power (kilowatts)"
  )
  
dev.copy(png, 
         file="plot2.png", 
         width=480, 
         height=480
         )
  dev.off()
 

#################################################################################################


windows()
plot(EPSubset$Datetime, EPSubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(EPSubset$Datetime, 
       EPSubset$Sub_metering_2, 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "red")
points(EPSubset$Datetime, 
       EPSubset$Sub_metering_3, 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering", 
       col = "blue")

legend("topright", lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, 
         file="plot3.png", 
         width=480, 
         height=480
)
dev.off()

#################################################################################################

windows()

par(mfrow = c(2, 2))

EPSubset$Global_reactive_power <- as.numeric(as.character(EPSubset$Global_reactive_power))
EPSubset$Voltage <- as.numeric(as.character(EPSubset$Voltage))
##

plot(EPSubset$Datetime, 
     EPSubset$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power", 
     xlab = ""
     )

##
plot(EPSubset$Datetime, 
     EPSubset$Voltage, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "Datetime"
     )


##
plot(EPSubset$Datetime, 
     EPSubset$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "", 
     col = "black"
     )
points(EPSubset$Datetime, 
       EPSubset$Sub_metering_2, 
       type = "l", 
       xlab = "", 
       ylab = "Sub_metering_2", 
       col = "red")
points(EPSubset$Datetime, 
       EPSubset$Sub_metering_3, 
       type = "l", 
       xlab = "", 
       ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

##
plot(EPSubset$Datetime, EPSubset$Global_reactive_power, type = "l", xlab = "Datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.copy(png, 
         file="plot4.png", 
         width=480, 
         height=480
)
dev.off()

