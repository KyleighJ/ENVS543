
getRiceData <- function(){
  
  library(tidyverse)
  library(lubridate)
  
  url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"
  
  read_csv( url )  |>
#turning date data into Date object
    mutate( Date = mdy_hms(DateTime, tz="EST") ) |>
#creating weekday, month, and day object
    mutate( Weekday = wday( Date, 
                            label = TRUE,
                            abbr = FALSE),
            Month = month( Date, 
                           label = TRUE,
                           abbr = FALSE ),
            Day = day( Date ))|>
#converting F to C
    mutate( AirTempC = 1.8 * (AirTempF - 32) ) |>
    mutate( Depth_m = Depth_ft / 3.281) |>
    mutate( WindSpeed_kph = WindSpeed_mph * 1.609) |>
    select( Date, Month, Day, Weekday, 
            H2O_TempC, ODO_sat, Depth_m, Turbidity_ntu, PH, Salinity_ppt,
            AirTempC, Rain_in, WindSpeed_kph, WindDir ) -> RICE

  return(RICE)
}




