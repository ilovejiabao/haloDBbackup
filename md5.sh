#!/bin/bash
LANG=en_US.UTF-8

dosomething()
{
 a=`grep 'FAILED' /tmp/md5.check|awk -F':' '{print $1}'`
 echo -e "\033[32m$a\033[0m changed !"
# if($a=="halo.mv.db")cd /.halo/db;
cd ~/.halo/db;git add .;git commit -m "update";git push origin master
   echo -e "\033[32m$a\033[0m changed !" | mail -s "数据库文件备份" 291727935@qq.com
rm -f /tmp/html.md5
}


find_file(){

  b=`find ~/.halo/db/halo.mv.db  -type f|xargs md5sum > /tmp/html.md5`
 echo $b

}

success()
{
echo "no change"
}

[ !  -f  /tmp/html.md5 ] && find_file 
md5sum -c /tmp/html.md5 > /tmp/md5.check    2>&1
[ $? -eq 0 ] && success || dosomething
