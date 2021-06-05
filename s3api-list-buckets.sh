#
# https://gist.github.com/apolloclark/7f805c503a3b4427955cabe93c6d824b
#
# aws s3api list-buckets --query 'Buckets[*].[Name]' --output text --profile siprod | xargs -I {} bash -c 'aws s3api get-bucket-encryption --profile siprod --bucket {}'
#

for bucket_name in $(aws s3api list-buckets --query "Buckets[].Name" --profile siprod --output text); do

    #echo ${bucket_name}
    
    encryption_info=$(aws s3api get-bucket-encryption \
        --bucket ${bucket_name} --profile siprod 2>/dev/null)
        
    if [[ $? != 0 ]]; then
     #   echo " - no-encryption"
        ENCR=",not-encrypted"
    else
        ENCR=",encrypted"
#        echo " - ${encryption_info}"
    fi
echo ${bucket_name}$ENCR
done


# aws s3api get-object --profile siprod --bucket sada-unencrypted-bucket --key resources.txt resources.txt
