
get_data <- function(){
  
  devtools::install_github("RamiKrispin/coronavirus", force = T,upgrade = F)
  
  #library(pacman)
  
  # p_load(
  #   "devtools",
  #   "coronavirus",
  #   "flexdashboard",
  #   "tidyverse",
  #   "leaflet",
  #   "htmltools",
  #   "dplyr",
  #   "DT",
  #   "plotly",
  #   "data.table",
  #   "lubridate"
  # )
  
  library(devtools)
  library(coronavirus)
  library(flexdashboard)
  library(tidyverse)
  library(leaflet)
  library(htmltools)
  library(dplyr)
  library(DT)
  library(plotly)
  library(data.table)
  library(lubridate)
  library(rmarkdown)
  
  data("coronavirus")
  
  saveRDS(coronavirus, 
          "C:/Users/rranadive/OneDrive - University of Mississippi Medical Center/Project1/data challenge/covid-19/data/newdata.RDS")
  print("new data saved")
}

get_data()

rmarkdown::render_site(input = "C:/Users/rranadive/OneDrive - University of Mississippi Medical Center/Project1/data challenge/covid-19/index.Rmd")
