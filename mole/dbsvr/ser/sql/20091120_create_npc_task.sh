#!/bin/bash
user="root"
password="ta0mee"
host="localhost"
tmp_file="table.sql"

create_animal_sql() {
cat <<EOF >$tmp_file
	CREATE TABLE IF NOT EXISTS t_user_npc_task_$1(
		userid			INT UNSIGNED NOT NULL DEFAULT '0',
		npc				INT UNSIGNED NOT NULL DEFAULT '0',		
		taskid			INT UNSIGNED NOT NULL DEFAULT '0',
		state			INT UNSIGNED NOT NULL DEFAULT '0',
		num				INT UNSIGNED NOT NULL DEFAULT '0',
		taskvalue		VARBINARY(50) NOT NULL DEFAULT '0X00000000',
		PRIMARY KEY(userid, npc, taskid)
	) ENGINE=innodb, CHARSET=utf8;
EOF
}


db_index=0
table_index=0
	while [ $db_index -lt 100 ]; do
		echo $db_index
		dbx=`printf "%02d" $db_index`
			while [ $table_index -lt 10 ];do
				tabx=`printf "%d" $table_index` 
        		create_animal_sql $tabx
        		cat $tmp_file | mysql -u $user --password="$password" -h $host "USER_$dbx"
				table_index=$(($table_index + 1))
			done
			table_index=0
			db_index=$(($db_index+1))
		done

