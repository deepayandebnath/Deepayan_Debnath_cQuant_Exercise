#Task1
data2016 <- read.csv("~/Documents/R/historicalPriceData/ERCOT_DA_Prices_2016.csv", header = TRUE)
data2017 <- read.csv("~/Documents/R/historicalPriceData/ERCOT_DA_Prices_2017.csv", header = TRUE)
data2018 <- read.csv("~/Documents/R/historicalPriceData/ERCOT_DA_Prices_2018.csv", header = TRUE)
data2019 <- read.csv("~/Documents/R/historicalPriceData/ERCOT_DA_Prices_2019.csv", header = TRUE)
total <- rbind(data2016, data2017, data2018, data2019)
str(total)
#Task2 
library(dplyr)
install.packages("lubridate")
library(lubridate)

total %>%
  mutate(date = month(Date)) %>%
  group_by(SettlementPoint,month(Date)) %>%
  summarize(AveragePrice = mean(Price))

AveragePrice <- total %>%
  mutate(date = month(Date)) %>%
  group_by(SettlementPoint, month(Date),year(Date)) %>%
  summarize(AveragePrice = mean(Price))
head(AveragePrice)
#Task3
write.csv(AveragePrice,"~/Documents/R/Tasks/AveragePriceByMonth.csv",col.names = c("SettlementPoint", "Year","Month","AveragePrice"))

#Task4
attach(total)
subset1 <- subset(total, Price > 0, select = c("Date","SettlementPoint","Price"))
str(subset1)
attach(subset1)
subset2 <-subset1[grep("^HB_",subset1$SettlementPoint),]

LogReturn  <-  log(Price/lag(Price))
LogReturn <- as.data.frame(LogReturn)
SqlnRet <- (LogReturn)^2
SqlnRet <- as.data.frame(SqlnRet)
subset2[,"SqlnRet"]<-SqlnRet
uniques <- (subset2$SettlementPoint)
#standard deviation =sqrt(sumation(SqlnRet/(n-1)))


#Task7
Files15 <-newdata$SettlementPoint[!duplicated(newdata$SettlementPoint)]
length(Files15)
Files15 <-newdata$SettlementPoint[!duplicated(newdata$SettlementPoint)]
length(Files15)
write.csv(x <-total[grep("^HB_BUSAVG",total$SettlementPoint),],
          file = "spot_HB_BUSAVG.csv")
write.csv(x <-total[grep("^HB_HOUSTON",total$SettlementPoint),],
          file = "spot_HB_HOUSTON.csv")
write.csv(x <-total[grep("^HB_HUBAVG",total$SettlementPoint),],
          file = "spot_HB_HUBAVG.csv")
write.csv(x <-total[grep("^HB_NORTH",total$SettlementPoint),],
          file = "spot_HB_NORTH.csv")
write.csv(x <-total[grep("^HB_SOUTH",total$SettlementPoint),],
          file = "spot_HB_SOUTH.csv")
write.csv(x <-total[grep("^HB_WEST",total$SettlementPoint),],
          file = "spot_HB_WEST.csv")
write.csv(x <-total[grep("^LZ_AEN",total$SettlementPoint),],
          file = "spot_LZ_AEN.csv")
write.csv(x <-total[grep("^LZ_CPS",total$SettlementPoint),],
          file = "spot_LZ_CPS.csv")
write.csv(x <-total[grep("^LZ_HOUSTON",total$SettlementPoint),],
          file = "spot_LZ_HOUSTON.csv")
write.csv(x <-total[grep("^LZ_LCRA ",total$SettlementPoint),],
          file = "spot_LZ_LCRA.csv")
write.csv(x <-total[grep("^LZ_NORTH",total$SettlementPoint),],
          file = "spot_LZ_NORTH.csv")
write.csv(x <-total[grep("^LZ_RAYBN",total$SettlementPoint),],
          file = "spot_LZ_RAYBN.csv")
write.csv(x <-total[grep("^LZ_SOUTH",total$SettlementPoint),],
          file = "spot_LZ_SOUTH.csv")
write.csv(x <-total[grep("^LZ_WEST",total$SettlementPoint),],
          file = "spot_LZ_WEST.csv")
write.csv(x <-total[grep("^HB_PAN",total$SettlementPoint),],
          file = "spot_HB_PAN.csv")
