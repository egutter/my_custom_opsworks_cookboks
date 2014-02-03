cron "job_name" do
  hour "*"
  minute "10"
  weekday "*"
  command "cd $HOME && date >> mylog.txt"
end
