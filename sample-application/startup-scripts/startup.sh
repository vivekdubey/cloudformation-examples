#!/bin/bash

run_command(){
  source ./env.sh
  RACK_ENV=production bundle exec rackup --port 8080 &>> output.log &
  echo $! > app.pid
  cat app.pid
}
stop(){
  pid=$(cat $pid_file)
  kill $pid
  rm -f $pid_file
}
start(){
if [[ -e $pid_file ]];then
  pid=$(cat $pid_file)
  if [[ -z $pid ]];then
    run_command
  else
    ps -p $pid
    if [[ $? == 0 ]];then
      echo "PID : $pid exists"
    else
      run_command
    fi
  fi
else
  run_command
fi
}

app_dir=/mnt/sample-application
cd $app_dir
pid_file=$app_dir/app.pid

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
esac
