#!/bin/bash
user="root"
password="ta0mee"
host="localhost"
tmp_file="table.sql"


create_question_table_sql() {
cat <<EOF >$tmp_file
CREATE TABLE  ROOMINFO_$1.t_question_$2 (
	userid         INT UNSIGNED NOT NULL,
	question_id    INT UNSIGNED,
	right_count    INT UNSIGNED,
	question_count INT UNSIGNED,
	total_right	   INT UNSIGNED,
	total_question INT UNSIGNED,
	PRIMARY KEY (userid)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

EOF
}



db_index=0
end_index=10

while [ $db_index -lt $end_index ] ; do
	echo $db_index
	dbx=`printf "%01d" $db_index`
		table_index=0
		while [ $table_index -lt 10 ] ; do
			tbx=`printf "%01d" $table_index`
			create_question_table_sql $dbx $tbx
			cat $tmp_file | mysql -u $user --password="$password" -h $host 
			table_index=`expr $table_index + 1`
		done
		db_index=`expr $db_index + 1`
done

