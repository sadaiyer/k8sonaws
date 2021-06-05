aws s3api get-object --profile siprod --bucket sada-unencrypted-bucket --key $1 $1
cat $1
rm $1
