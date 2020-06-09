#!/bin/bash

#just in case we want to undo the blocking we have done so far
function unblock {
    #just making a backup of the /etc/hosts file
    #make /etc/hosts file writable
    sudo chattr -i /etc/hosts

    #remove every line that ends with #block
    #put every other line into temp.txt, replace /etc/hosts with this
    touch temp.txt
    while read p; do
        leng=${#p}
        start=$leng-5
        b=${p:start:5}
        if [ "$b" = "block" ]; then
            echo "removing line $p"
        else
            sudo echo "$p" >> temp.txt
        fi
    done </etc/hosts
    sudo cp temp.txt /etc/hosts
    sudo rm temp.txt
    exit
}

#introductory message giving instructions to user
echo 'Enter the web address of each website you wish to block.'
echo 'I.E "youtube.com". Do not enter a prefix like https:// or www.'
echo 'Press enter after each site.'
echo 'When you are done, type "end", and hit enter.'
echo 'If you make a typo and want to undo the blocking you have done:'
echo 'Type "undo" and it will revert the hosts file to its prior state'

#now read each site, add them to /etc/hosts as blocked sites
#make sure /etc/hosts file is writable
sudo chattr -i /etc/hosts

#now read in user input
while read line
do
    if [ "$line" = "end" ]; then
        echo 'Done!'
        break
    elif [ "$line" = "undo" ]; then
        echo 'undoing blocking!'
        unblock
    else
        # use $line variable to process line
	    # append #block to the end of each line so that we can 
        # identify which lines we have added later and remove them
        sudo echo "127.0.0.1 https://www.$line #block" >> /etc/hosts
        sudo echo "127.0.0.1 https://$line #block" >> /etc/hosts
        sudo echo "127.0.0.1 www.$line #block" >> /etc/hosts
    fi
done

#make hosts file unmutable (to undo use sudo chattr -i /etc/hosts)
sudo chattr +i /etc/hosts

#clear dns cache so changes will take place
sudo /etc/init.d/dns-clean restart
