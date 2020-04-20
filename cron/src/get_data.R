
get_data <- function(){
  
  devtools::install_github("RamiKrispin/coronavirus", force = T,upgrade = F)
  
  library(pacman)
  
  p_load(
    "devtools",
    "coronavirus",
    "flexdashboard",
    "tidyverse",
    "leaflet",
    "htmltools",
    "dplyr",
    "DT",
    "plotly",
    "data.table",
    "lubridate"
  )
  
  data("coronavirus")
  
  saveRDS(coronavirus, "data/newdata.RDS")
  print("new data saved")
}

get_data()
