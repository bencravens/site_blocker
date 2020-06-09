# site_blocker
Simple command line tool to block timewasting websites. Usage:
```bash
sudo bash block_sites.sh
```
Simply type in the websites you wish to permanently block in the format 'site.com'
(i.e no prefix like https:// or www)

WARNING: this tool will alter your /etc/hosts file to make it read only. To undo this,
run the following command in terminal:
```bash
sudo chattr -i /etc/hosts
```
If you wish to undo the site blocking, simply run the program as below
```bash
sudo bash block_sites.sh
>>>Enter the web address of each website you wish to block.
I.E "youtube.com". Do not enter a prefix like https:// or www.
Press enter after each site.
When you are done, type "end", and hit enter.
If you make a typo and want to undo the blocking you have done:
Type "undo" and it will revert the hosts file to its prior state
undo
>>>undoing blocking!
```
Also, you may need to restart your browser for the changes to take place.
