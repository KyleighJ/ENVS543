
getRiceData <- function(){
  
  
}


library(tidyverse)
library(lubridate)
library(knitr)
library(kableExtra)

url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"

read_csv( url ) -> rice

# make date object
# make month and weekday object
# convert F -> C
# get rid of extra data
# reorder the columns

# return( rice )

names(rice)

rice |>
  mutate( Date = mdy_hms(DateTime, tz="EST") ) |>
  mutate( Weekday = wday( Date, 
                         label = TRUE,
                         abbr = FALSE),
          Month = month( Date, 
                        label = TRUE,
                        abbr = FALSE ) )|>
  group_by( Month, Weekday ) |>
  mutate( H2O_Temp = 1.8 * H2O_TempC + 32 ) |>
  select( -H2O_TempC ) |>
  select( DateTime, H2O_Temp, ODO_sat, Depth_ft, Turbidity_ntu, PH, Salinity_ppt,
          AirTempF, Rain_in, WindSpeed_mph, WindDir ) |>
  summarize( `Air Temp`= mean( AirTempF ),
             `Wind Speed` = mean( WindSpeed_mph),
             `Wind Direction` = mean( WindDir ),
             `Rain Inches` = mean(Rain_in),
             `Depth` = mean( Depth_ft ),
             `Water Temp` = mean( H2O_Temp, na.rm = TRUE),
             `ODO` = mean( ODO_sat, na.rm = TRUE ),
             `Turbidity` = mean( Turbidity_ntu, na.rm = TRUE ),
             `Salinity` = mean( Salinity_ppt, na.rm = TRUE ),
             `pH` = mean( PH, na.rm = TRUE ))|>
  kable()|>
  kable_minimal()

