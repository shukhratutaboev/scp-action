#!/bin/sh -l

# 1 - host
# 2 - user
# 3 - key
# 4 - port
# 5 - src
# 6 - dst
# 7 - conn

echo -e $3 > key
chmod 600 key

tar -czvf $5.tar.gz $5

scp -o StrictHostKeyChecking=no -i key -P $4 $5.tar.gz $2@$1:$6

ssh -o StrictHostKeyChecking=no -i key -p $4 $2@$1 "cd $6 && tar -xzvf $5.tar.gz && rm $5.tar.gz && chmod +x $5 && ./$5 $7 && rm $5"