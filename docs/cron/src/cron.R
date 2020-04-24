library(cronR)

#--> job 1:
path <- "/home/rradhikesh/projects/covid-19/cron/src/get_data.R"
cmd <- cron_rscript(path)
cron_add(cmd, frequency = '0 6 * * *', id = 'job1', description = 'Every day at 00:05')   

#--> job 2:
# path <- "/home/rradhikesh/projects/covid-19/cron/src/gitpush.sh"
# cmd <- 
# cron_add(cmd, frequency = '*/25 * * * *', id = 'job2', description = 'Every 25 min')   

#--> list of cron jobs
#cron_ls()
#--> clear cron job
#cron_clear(ask=FALSE)


#cron_rm(id = "job1")
#git remote set-url origin git@github.com:radhikesh/covid-19.git