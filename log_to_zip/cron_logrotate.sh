# 1. SETTING
#   need to install apache | apache util
# 2. PATH
#   etc > logrotate.d > log_sample 
# 3. EXEC
#   restart crontab

/home/USER/APP/PROJECT/LOG.out {
   daily
   dateext
   rotate 180
   missingok
   compress
   notifempty
   create 644 USER USER
   copytruncate
   su USER USER
}