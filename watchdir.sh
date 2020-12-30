#!/bin/bash
#filename watchdir.sh
path=~/.halo/db/halo.mv.db
/usr/bin/inotifywait -m --timefmt '%d/%m/%y/%H:%M' --format '%T %w%f %e' -e modify $path |
while read events;
#sum=0
do 
  echo $events
  local eve=$events
  echo $eve | awk " " '{print $2}'
  #let sum++
#echo $events | mail -s "这是真的可以发送邮件了哦" 291727935@qq.com
  #echo "file sync github success~";
done
#echo $sum;
