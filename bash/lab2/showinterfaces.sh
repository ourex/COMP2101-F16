#!/bin/bash

#Create an array using the output of ifconfig which has the names of
#the network interfaces in it. Use those names to extract the ip addresses
#of the interfaces, also using ifconfig output. Also parse the output of
#route -n to display the ip address of the default gateway


#make array with output from ifconfig taking the name fromt the start of each line
interfacenames=(`ifconfig|grep '^[a-zA-Z]'|awk '{print $1}'`)

echo "Interface names found: ${interfacenames[@]}"

declare -a ips
#using sed instead of awk to chop down output of ifconfig to find IP of the interfacename
ips[0]=`ifconfig ${interfacenames[0]}| grep 'inet addr'|
		sed -e 's/ *inet addr://'|sed -e 's/ .*//'`
#now using awk and cut
ips[1]=`ifconfig ${interfacenames[1]}| grep 'inet addr'|
		awk '{print $2}'| cut 6-`


#find default route
gatewayip=`route -n|grep '^0.0.0.0'|awk '{print $2}'` 



cat <<EOF
Interface ${interfacenames[0]} has address ${ips[0]}
Interface ${interfacenames[1]} has address ${ips[1]}

My default gateway is ${gatewayip}
EOF
