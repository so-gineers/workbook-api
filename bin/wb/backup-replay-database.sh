#!/bin/bash

echo $(date +"%Y-%m-%d %T"): START workbook_api database backup
echo $(date +"%Y-%m-%d %T"): Dump the database
PGPASSWORD=$RAILS_DB_PASSWORD pg_dump -v --host=$RAILS_DB_HOST --user=$RAILS_DB_USER--dbname=$RAILS_DB_NAME | gzip -f > test.gz  #/var/backups/workbook_api-$(date +"%Y%m%d%T").psql.gz
# echo $(date +"%Y-%m-%d %T"): Remove old backups
# ls -1trd /var/backups/* | head -n -5 | xargs rm -f
echo $(date +"%Y-%m-%d %T"): END workbook_api database backup
