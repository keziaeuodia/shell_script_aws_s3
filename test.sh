#!/bin/bash

aws s3 ls

cd /home/kezia/Documents/CodingNomads/shellscript/scripting_challenge/

CURRENT_TIME=$(date "+%Y.%m.%d-%H.%M.%S")
BUCKET_NAME="$CURRENT_TIME-backup"

echo "creating bucket"

aws s3 mb s3://$BUCKET_NAME

echo "starting s3 transfer..."

aws s3 cp . s3://$BUCKET_NAME/ --recursive --exclude "*" --include "*.txt"

aws s3 cp . s3://$BUCKET_NAME/ --recursive --exclude "*" --include "*.jpg"

echo "s3 transfer complete!"

echo "deleting directory"

rm -rf /home/kezia/Documents/CodingNomads/shellscript/scripting_challenge/

echo "creating new directory"

mkdir /home/kezia/Documents/CodingNomads/shellscript/$BUCKET_NAME/

cd /home/kezia/Documents/CodingNomads/shellscript/$BUCKET_NAME/

echo "copying from s3"

aws s3 cp s3://$BUCKET_NAME/ . --recursive

echo "complete."
