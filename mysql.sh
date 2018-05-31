#!/bin/bash

DATABASE=Factory
FILE=Factory.sql
CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
FILENAME="$CURRENT_TIME-$DATABASE"

echo "starting DB backup procedure..."
echo "starting mysqldump..."


mysqldump --user=root --password=[password] --host=127.0.0.1 $DATABASE > /home/kezia/Documents/CodingNomads/awstest/$FILENAME.sql

echo "mysqldump complete."

echo "starting s3 transfer..."

aws s3 cp /home/kezia/Documents/CodingNomads/awstest/$FILENAME.sql s3://codingnomads-mysql

echo "s3 transfer complete! backup can be found at s3://mysql-backup-test-codingnomads/$FILENAME"

echo "complete."
