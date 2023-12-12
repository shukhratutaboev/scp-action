#!/bin/sh -l

# 1 - host
# 2 - user
# 3 - key
# 4 - port
# 5 - src
# 6 - dst

echo -e $3 > key
chmod 600 key

tar -cJvf $5.tar.xz $5

scp -o StrictHostKeyChecking=no -i key -P $4 $5.tar.xz $2@$1:$6

ssh -o StrictHostKeyChecking=no -i key -p $4 $2@$1 "cd $6 && tar -xJvf $5.tar.xz && rm $5.tar.xz"