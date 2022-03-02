#!/bin/bash
### design-patterns.textpattern.com build script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/philwareham/textpattern-hive-admin-theme"
repo_branch_dev="main"
repo_branch_stable="4.8.x"
repo_source_dir_stub="/var/www/servers/textpattern.com/design-patterns/staging/_github"
web_target_dir_dev="/var/www/servers/textpattern.com/design-patterns/live/dev"
web_target_dir_stable="/var/www/servers/textpattern.com/design-patterns/live/stable"

### dev nuke and repave
rm -rf $repo_source_dir_stub-$repo_branch_dev
git clone --branch "$repo_branch_dev" --depth 1 --single-branch $repo_url.git $repo_source_dir_stub-$repo_branch_dev
chown -R www-data:www-data $repo_source_dir_stub-$repo_branch_dev/
chmod -R 775 $repo_source_dir_stub-$repo_branch_dev/
if [ -f $repo_source_dir_stub-$repo_branch_dev/README.md ]; then
rm -rf $web_target_dir_dev \
&& mkdir -p $web_target_dir_dev/ \
&& chown -R www-data:www-data $web_target_dir_dev/ \
&& chmod -R 775 $web_target_dir_dev/ \
&& mv $repo_source_dir_stub-$repo_branch_dev/dist $web_target_dir_dev \
&& mv $repo_source_dir_stub-$repo_branch_dev/docs $web_target_dir_dev \
&& mv $repo_source_dir_stub-$repo_branch_dev/mockups $web_target_dir_dev \
&& chown -R www-data:www-data $web_target_dir_dev/ \
&& chmod -R 775 $web_target_dir_dev/ \
&& rm -rf $repo_source_dir_stub-$repo_branch_dev
fi

### stable nuke and repave
rm -rf $repo_source_dir_stub-$repo_branch_stable
git clone --branch "$repo_branch_stable" --depth 1 --single-branch $repo_url.git $repo_source_dir_stub-$repo_branch_stable
chown -R www-data:www-data $repo_source_dir_stub-$repo_branch_stable/
chmod -R 775 $repo_source_dir_stub-$repo_branch_stable/
if [ -f $repo_source_dir_stub-$repo_branch_stable/README.md ]; then
rm -rf $web_target_dir_stable \
&& mkdir -p $web_target_dir_stable/ \
&& chown -R www-data:www-data $web_target_dir_stable/ \
&& chmod -R 775 $web_target_dir_stable/ \
&& mv $repo_source_dir_stub-$repo_branch_stable/dist $web_target_dir_stable \
&& mv $repo_source_dir_stub-$repo_branch_stable/docs $web_target_dir_stable \
&& mv $repo_source_dir_stub-$repo_branch_stable/mockups $web_target_dir_stable \
&& chown -R www-data:www-data $web_target_dir_stable/ \
&& chmod -R 775 $web_target_dir_stable/ \
&& rm -rf $repo_source_dir_stub-$repo_branch_stable
fi
