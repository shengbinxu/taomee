#!/bin/bash
user="root"
password="ta0mee"
host="localhost"
tmp_file="table.sql"
alter_user_ex_table_sql() {
cat <<EOF >$tmp_file
   CREATE TABLE IF NOT EXISTS t_roominfo_sports_pet_info_$1(
			petid        INT UNSIGNED NOT NULL DEFAULT 0,
			userid       INT UNSIGNED NOT NULL DEFAULT 0,
			reward_flag         INT UNSIGNED NOT NULL DEFAULT 0,
			PRIMARY KEY (petid, userid)
   ) ENGINE=innodb, CHARSET=utf8;
EOF
}

db_index=0
end_index=10

while [ $db_index -lt $end_index ] ; do
	dbx=`printf "%01d" $db_index`
	echo $dbx
	table_index=0
	while [ $table_index -lt 10 ] ; do
		tbx=`printf "%d" $table_index`
		alter_user_ex_table_sql $tbx 
		cat $tmp_file | mysql -u $user --password="$password" -h $host "ROOMINFO_$dbx" 
		let "table_index+=1"
	done
	let "db_index+=1"
done

