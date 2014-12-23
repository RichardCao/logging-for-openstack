#!/bin/bash

prefix=10.1.0.
start=150
end=155
#special=10.2.1.121

read -p "Input the LDAP username on servers: " user
echo $user
read -p "Input the password of LDAP user $user: " -s passwd
echo "\n"

./generate_key.sh

for i in $(eval echo "{$start..$end}" $master);
do
	./copysshkey.sh $user $prefix$i $passwd
done

#./copysshkey.sh $user $special $passwd
