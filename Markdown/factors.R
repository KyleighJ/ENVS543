source( "getRiceData.R" )

rice <- getRiceData()

library( forcats )

library( knitr )

library( kableExtra )

rice$Weekday <- factor( rice$Weekday )

rice <- rice |>
  mutate( Weekday = fct_relevel( Weekday,
                                 c("Monday", "Tuesday", "Wednesday", "Thursday", 
                                   "Friday", "Saturday", "Sunday")))
levels( rice$Weekday )


wkdy_wknd <- function(day) {
  if (day %in% c("Saturday", "Sunday")) {
    return("Weekend")
  } else {
    return("Weekday")
  }
}

rice |>
  mutate( Weekend = wkdy_wknd(Weekday)) -> rice 


