#!/bin/bash
### docs.textpattern.com site scaffold and permissions script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/textpattern/textpattern.github.io"
repo_branch="self-hosted"
repo_parent_dir="/var/www/servers/textpattern.com/docs-test/staging"
repo_source_dir="/var/www/servers/textpattern.com/docs-test/staging/_github-self-hosted"
web_target_dir="/var/www/servers/textpattern.com/docs-test/live/_site"

if [ -f $repo_parent_dir/_github-$repo_branch/_site/index.html ]; then
rm -rf $web_target_dir/ \
&& echo "Moving files into place..." \
&& mkdir -p $web_target_dir/ \
&& mv $repo_source_dir/_site/* $web_target_dir/ \
&& chmod -R www-data:www-data $web_target_dir/ \
&& chown -R 775 $web_target_dir/ \
&& echo "Done."
fi
