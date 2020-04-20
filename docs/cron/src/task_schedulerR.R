myscript <- system.file("extdata", "get_data.R", package = "taskscheduleR")

#myscript <- paste0("C:/Users/rranadive/OneDrive - University of Mississippi Medical Center/Project1/data challenge/covid-19/cron/src/", "get_data.R") 
                  
taskscheduler_create(taskname = "covid19_dataextract", rscript = myscript , 
                     schedule = "MINUTE",  starttime = format(Sys.time()+62, "%H:%M"),
                     startdate = format(Sys.Date(), "%m/%d/%Y"),
                     modifier = 5)


tasks <- taskscheduler_ls()
str(tasks)

taskscheduler_delete(taskname = "myfancyscript_5min")


