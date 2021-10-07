
library(readxl)
library(dplyr)

url <- "http://www.cleanenergyregulator.gov.au/DocumentAssets/Documents/Postcode%20data%20for%20small-scale%20installations%20-%20SGU-Solar.csv"
destfile <- "C:/Users/aidan/OneDrive/Desktop/RStudio/CER data"


PVDataToDate <- read.csv(url(url))

y <- as.double(format(Sys.Date(), format = "%Y"))-2

i <- 2001


df_total <- data.frame()

for (i in 2001:y) {
  url <- paste0("http://www.cleanenergyregulator.gov.au/DocumentAssets/Documents/Postcode%20data%20for%20small-scale%20installations%20",i,"%20-%20SGU-Solar.csv")
  x <- read.csv(url)
  df <- t(data.frame(x))
  df_total <- rbind(df_total, df)
  i <- i +1
  }


df_total <- unique(df_total)
colnames(df_total) <- df_total[1,]  
test <- df_total

rownames(df_total)

df_total <- df_total[-grep("Total", rownames(df_total)),]

df_total <- df_total[-grep("Prev", rownames(df_total), ignore.case = TRUE),]
write.csv(df_total, file = "test.csv")
