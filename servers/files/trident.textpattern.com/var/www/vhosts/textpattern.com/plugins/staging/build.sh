#!/bin/bash
### plugins.textpattern.com build script

### get latest files
rm -rf /var/www/vhosts/textpattern.com/plugins/staging/_github
git clone --branch 'master' --depth 1 --single-branch https://github.com/textpattern/textpattern-curated-plugins-list/git /var/www/vhosts/textpattern.com/plugins/staging/_github

### drop it (in) like it's hot
rm -rf /var/www/vhosts/textpattern.com/plugins/live/library-of-plugins/
mkdir -p /var/www/vhosts/textpattern.com/plugins/live/library-of-plugins/
mv /var/www/vhosts/textpattern.com/plugins/staging/_github/textpattern-curated-plugins-list/* /var/www/vhosts/textpattern.com/plugins/live/library-of-plugins/

### mop up
chown -R www-data:www-data /var/www/vhosts/textpattern.com/plugins/live/library-of-plugins/
chmod -R 775 /var/www/vhosts/textpattern.com/plugins/live/library-of-plugins/
rm -rf /var/www/vhosts/textpattern.com/plugins/staging/_github
