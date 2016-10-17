#!/bin/bash

#Create an array using the output of ifconfig which has the names of
#the network interfaces in it. Use those names to extract the ip addresses
#of the interfaces, also using ifconfig output. Also parse the output of
#route -n to display the ip address of the default gateway


#make array with output from ifconfig taking the name fromt the start of each line
interfacenames=(`ifconfig|grep '^[a-zA-Z]'|awk '{print $1}'`)

echo "Interface names found: ${interfacenames[@]}"

declare -a ips
intfindex=0
while [$intfindex -lt ${#interfacenames[@]}]; do

#using sed instead of awk to chop down output of ifconfig to find IP of the interfacename
ips[$intfindex]=`ifconfig ${interfacenames[$intfindex]}| grep 'inet addr'|
		sed -e 's/ *inet addr://'|sed -e 's/ .*//'`

	echo "interface ${interfacenames[$intfindex]} has address ${ips[$intfindex]}"
	indfindex=$((intfindex++))
done


#find default route
gatewayip=`route -n|grep '^0.0.0.0'|awk '{print $2}'` 



cat <<EOF
My default gateway is ${gatewayip}
EOF
