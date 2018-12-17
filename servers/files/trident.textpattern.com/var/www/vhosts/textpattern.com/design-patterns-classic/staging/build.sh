#!/bin/bash
### design-patterns-classic.textpattern.com build script

### get latest files
rm -rf /var/www/vhosts/textpattern.com/design-patterns-classic/staging/_github
git clone --branch 'master' --depth 1 --single-branch https://github.com/philwareham/textpattern-classic-admin-theme.git /var/www/vhosts/textpattern.com/design-patterns-classic/staging/_github

### drop it (in) like it's hot
rm -rf /var/www/vhosts/textpattern.com/design-patterns-classic/live/*
mv /var/www/vhosts/textpattern.com/design-patterns-classic/staging/_github/dist /var/www/vhosts/textpattern.com/design-patterns-classic/live/
mv /var/www/vhosts/textpattern.com/design-patterns-classic/staging/_github/docs /var/www/vhosts/textpattern.com/design-patterns-classic/live/
mv /var/www/vhosts/textpattern.com/design-patterns-classic/staging/_github/mockups /var/www/vhosts/textpattern.com/design-patterns-classic/live/

### mop up
chown -R www-data:www-data /var/www/vhosts/textpattern.com/design-patterns-classic/live/
chmod -R 755 /var/www/vhosts/textpattern.com/design-patterns-classic/live/

### done
exit
