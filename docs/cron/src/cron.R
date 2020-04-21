library(cronR)
f <- system.file(package = "cronR", "extdata", "helloworld.R")
cmd <- cron_rscript(f)
cmd

path <- "/home/rradhikesh/projects/covid-19/cron/src/get_data.R"
cmd <- cron_rscript(path)
cmd



cron_add(cmd, frequency = '*/15 * * * *', id = 'job1', description = 'Every 15 min')   
cron_ls()
