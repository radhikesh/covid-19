raw_conf <- read.csv(file = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv",
                     stringsAsFactors = FALSE)

lapply(1:ncol(raw_conf), function(i){
  if(all(is.na(raw_conf[, i]))){
    raw_conf <<- raw_conf[, -i]
    return(print(paste("Column", names(raw_conf)[i], "is missing", sep = " ")))
  } else {
    return(NULL)
  }
})

# Fixing US data
# Aggregating county level to state level
raw_us_conf <- raw_conf %>%
  dplyr::filter(Country.Region == "US") %>%
  dplyr::mutate(state = ifelse(!grepl(",", Province.State),
                               Province.State,
                               trimws(substr(Province.State,
                                             regexpr(",", Province.State) + 1,
                                             regexpr(",", Province.State) + 3)))) %>%
  dplyr::left_join(data.frame(state = state.abb,
                              state_name = state.name,
                              stringsAsFactors = FALSE),
                   by = "state") %>%
  dplyr::mutate(state_name = ifelse(is.na(state_name), state, state_name)) %>%
  dplyr::mutate(state_name = ifelse(state_name == "D.", "Washington, D.C.", state_name)) %>%
  dplyr::mutate(Province.State = state_name) %>%
  dplyr::select(-state, -state_name)

raw_us_map <- raw_us_conf %>%
  dplyr::select("Province.State","Country.Region", "Lat", "Long") %>%
  dplyr::distinct() %>%
  dplyr::mutate(dup = duplicated(Province.State)) %>%
  dplyr::filter(dup == FALSE) %>%
  dplyr::select(-dup)

us_agg_conf <- aggregate(x = raw_us_conf[, 5:(ncol(raw_us_conf))], by = list(raw_us_conf$Province.State), FUN = sum) %>%
  dplyr::select(Province.State = Group.1, dplyr::everything())

