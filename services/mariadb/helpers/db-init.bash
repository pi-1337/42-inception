#!/bin/bash

# echo "" > /tmp/seed.sql
# 
# # create DB with env params in order for wordpress to connect to it
# echo "CREATE DATABASE $DB_NAME;" > /tmp/seed.sql
# echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> /tmp/seed.sql
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> /tmp/seed.sql
# echo "FLUSH PRIVILEGES;" >> /tmp/seed.sql
# 
# echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';" >> /tmp/seed.sql
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_DB_USER'@'%';" >> /tmp/seed.sql
# echo "FLUSH PRIVILEGES;" >> /tmp/seed.sql
# 
# 
# # for mysqld to run it needs this dir, ez
# mkdir -p /run/mysqld/
# 
# # logging the seed for DEBUGGING
# echo "==== START LOGGING SEED.SQL ===="
# cat /tmp/seed.sql
# echo "==== END LOGGING SEED.SQL ===="
# 
# # run mariadb server as PID 1
# exec mysqld --user=root --bind-address=0.0.0.0 --init-file=/tmp/seed.sql



#!/bin/bash
mkdir -p /run/mysqld/

# Create the seed file properly
cat << EOF > /tmp/seed.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld --user=root --bind-address=0.0.0.0 --init-file=/tmp/seed.sql
