#!/bin/bash
### design-patterns-4-7.textpattern.com build script

### get latest files
rm -rf /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github
git clone --branch '4.7.x' --depth 1 --single-branch https://github.com/philwareham/textpattern-hive-admin-theme.git /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github

### drop it (in) like it's hot
rm -rf /var/www/vhosts/textpattern.com/design-patterns-4-7/live/*
mv /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github/dist /var/www/vhosts/textpattern.com/design-patterns-4-7/live/
mv /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github/docs /var/www/vhosts/textpattern.com/design-patterns-4-7/live/
mv /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github/mockups /var/www/vhosts/textpattern.com/design-patterns-4-7/live/

### mop up
chown -R www-data:www-data /var/www/vhosts/textpattern.com/design-patterns-4-7/live/
chmod -R 755 /var/www/vhosts/textpattern.com/design-patterns-4-7/live/
rm -rf /var/www/vhosts/textpattern.com/design-patterns-4-7/staging/_github
