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
Also, you may need to restart your browser for the changes to take place.
