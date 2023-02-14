#!/bin/sh

sh create_db.sh

/usr/bin/mysqld --skip-log-error --port=3306
