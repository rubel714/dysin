#! /bin/bash
export TZ=Asia/Dhaka
day="$(date +'%Y_%m_%d_%H_%I_%M_')"
filename="$(date +'%Y_%m_%d_')"
mysqldump -u ngplcom_ngplcom '-p12@ASasdfghjkl' ngplcom_pharmangpl | gzip >/home/ngplcom/pharma.ng-pl.com/databasebackup/${filename}ngplcom_pharmangpl.sql.gz