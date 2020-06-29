#!/bin/bash
### design-patterns.textpattern.com build script

### get latest files
rm -rf /var/www/vhosts/textpattern.com/design-patterns/staging/_github
git clone --branch 'master' --depth 1 --single-branch https://github.com/philwareham/textpattern-hive-admin-theme.git /var/www/vhosts/textpattern.com/design-patterns/staging/_github

### drop it (in) like it's hot
rm -rf /var/www/vhosts/textpattern.com/design-patterns/live/*
mv /var/www/vhosts/textpattern.com/design-patterns/staging/_github/dist /var/www/vhosts/textpattern.com/design-patterns/live/
mv /var/www/vhosts/textpattern.com/design-patterns/staging/_github/docs /var/www/vhosts/textpattern.com/design-patterns/live/
mv /var/www/vhosts/textpattern.com/design-patterns/staging/_github/mockups /var/www/vhosts/textpattern.com/design-patterns/live/

### mop up
chown -R www-data:www-data /var/www/vhosts/textpattern.com/design-patterns/live/
chmod -R 755 /var/www/vhosts/textpattern.com/design-patterns/live/
