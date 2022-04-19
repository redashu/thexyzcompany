#!/bin/bash

## this script will create two containers per user 
## subnet series 
net_name1="ansible_host1"
net_name2="ansible_host2"
net_sub1=192.168.100
net_sub2=192.168.101
conf_dir="thexyzcompany"
if [ "$1" == "create" ]
then
	echo -e "Enter number of users \t"
	read u;
	echo -e "You have entered $u number of users : \n"
	# creating config file for this script
	mkdir ~/.$conf_dir  &>/dev/null
	## removing existing file
	rm -rf ~/.$conf_dir/ansible_host.txt 
	rm -rf ~/.$conf_dir/name.txt
	# using iteration 
	for  i in `seq $u`
	do 
		if [ $i -eq 1 ]
		then 
			echo "skiping first ip "
		else :
			# removing existing file 
			echo "creating container node$i "
			sleep 0.58
			docker run --name centosnode$i -itd --network $net_name1  --ip 192.168.100.$i --privileged dockerashu/ansible:centos_targetv2 
			docker run --name fedoranode$i -itd --network $net_name2  --ip 192.168.101.$i --privileged dockerashu/ansible:fedora_targetv2
			# maintaining ip 
			echo "$net_sub1.$i" >>~/.$conf_dir/ansible_host.txt 
			echo "$net_sub2.$i" >>~/.$conf_dir/ansible_host.txt 
			# maintaining name of container 
			echo "centosnode$i" >>~/.$conf_dir/name.txt 
			echo "fedoranode$i" >>~/.$conf_dir/name.txt 
		fi
	done
	## final info 
	sleep 3
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	## testing lab 
	echo "testing lab"
	for i in `cat ~/.$conf_dir/name.txt`
	do 
		docker exec -it $i rm -f /var/run/nologin &>/dev/null
	done
	echo "_____________________________________________________"
	echo "_____________________________________________________"
	echo "_____________________________________________________"
	echo "you can get list of IP address of all running containers"
	echo " this is `echo ~/.$conf_dir/ansible_host.txt` the file  "

	echo "_______________________________________"

elif [ "$1" == "destroy" ]
then
	echo "______________________________________"
	echo " make sure you have all things sorted "
	echo " press y to delete "
	sleep 1
	read ans;
	if [ "$ans" == "y" ]
	then
		echo "deleting .."
		sleep 1
		# deleting only those containers which is creating 
		for i in `cat ~/.$conf_dir/name.txt`
		do
			docker rm $i -f  &>/dev/null
		done
	else 
		echo "plz press y only"

	fi
elif [ "$1" == "stop" ]
then 
	echo "stopping lab..."
	sleep 1
	# stopping lab
	for i in `cat ~/.$conf_dir/name.txt`
	do
			docker kill  $i  &>/dev/null
	done

elif [ "$1" == "start" ]
then 
	echo "starting lab..."
	sleep 1
	# starting lab
	for i in `cat ~/.$conf_dir/name.txt`
	do
			docker start  $i  &>/dev/null
	done

elif [ "$1" == "--help" -o "$1" == "-h" ]
then 
	sleep 1
	echo "you can use options like start|stop|create|destroy"
	echo "enjoy the labs ..!!"
elif [ $# -eq 0 ]
then 
	echo "please pass some argument .."
	echo "to check argument use --help or -h "

fi

