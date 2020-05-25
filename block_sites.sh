#!/bin/bash
echo 'Enter the web address of each website you wish to block.'
echo 'I.E "youtube.com". Do not enter a prefix like https:// or www.'
echo 'Press enter after each site.'
echo 'When you are done, type "end", and hit enter.'

#now read each site, add them to /etc/hosts as blocked sites
while read line
do
    if [ $line = "end" ]; then
        echo 'Done!'
        break
    else
        # use $line variable to process line
	    sudo echo "127.0.0.1 https://www.$line" >> /etc/hosts
        sudo echo "127.0.0.1 https://$line" >> /etc/hosts
        sudo echo "127.0.0.1 www.$line" >> /etc/hosts
    fi
done

#make hosts file unmutable (to undo use sudo chattr -i /etc/hosts)
sudo chattr +i /etc/hosts

#clear dns cache so changes will take place
sudo /etc/init.d/dns-clean restart
