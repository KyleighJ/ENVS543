source( "getRiceData.R" )

rice <- getRiceData()

library( forcats )

library( tidyverse )

library( knitr )

library( kableExtra )

library( lunar )

rice$Weekday <- factor( rice$Weekday )

rice <- rice |>
  mutate( Weekday = fct_relevel( Weekday,
                                 c("Monday", "Tuesday", "Wednesday", "Thursday", 
                                   "Friday", "Saturday", "Sunday")))
levels( rice$Weekday )

df <- rice |>
  mutate( wkdy_wknd = fct_recode( Weekday,
                                  "Weekday" = "Monday",
                                  "Weekday" = "Tuesday",
                                  "Weekday" = "Wednesday",
                                  "Weekday" = "Thursday",
                                  "Weekday" = "Friday",
                                  "Weekend" = "Saturday",
                                  "Weekend" = "Sunday"))

head( df )







wkdy_wknd <- function(day) {
  if (day %in% c("Saturday", "Sunday")) {
    return("Weekend")
  } else {
    return("Weekday")

