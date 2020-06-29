#!/bin/bash
### plugins.textpattern.com build script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/textpattern/textpattern-curated-plugins-list"
repo_branch="master"
repo_parent_dir="/var/www/vhosts/textpattern.com/plugins/staging"
repo_source_dir="/var/www/vhosts/textpattern.com/plugins/staging/_github-master/library-of-plugins"
web_target_dir="/var/www/vhosts/textpattern.com/plugins/live/library-of-plugins"

rm -rf $repo_parent_dir/_github-$repo_branch
git clone --branch "$repo_branch" --depth 1 --single-branch $repo_url.git $repo_parent_dir/_github-$repo_branch
chown -R www-data:www-data $repo_parent_dir/_github-$repo_branch/
chmod -R 775 $repo_parent_dir/_github-$repo_branch/
if [ -f $repo_parent_dir/_github-$repo_branch/README.md ]; then
rm -rf $web_target_dir/ \
&& mkdir -p $web_target_dir/ \
&& mv $repo_source_dir/* $web_target_dir/ \
&& chown -R www-data:www-data $web_target_dir/ \
&& chmod -R 775 $web_target_dir/
fi
