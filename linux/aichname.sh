#!/bin/bash

if [[ $# -ne 1 ]];then
    echo "$0 [dir]" 
    exit 0
fi
printf "Starting......\n\n"

pushd $1 > /dev/null

aifiles=`ls QRD_*`

for i in ${aifiles};do
    echo "old file name:${i}"
    md5sum ${i}
    new_name=${i:4}
    mv ${i} ${new_name}
    echo "new file name:${new_name}"
    md5sum ${new_name}
    printf "\n"
done

popd > /dev/null
echo "End......"
