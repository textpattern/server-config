#!/bin/bash
### docs.textpattern.com build script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/textpattern/textpattern.github.io"
repo_branch="self-hosted"
repo_parent_dir="/var/www/servers/textpattern.com/docs-test/live"
repo_source_dir="/var/www/servers/textpattern.com/docs-test/live/_github-self-hosted"
web_target_dir="/var/www/servers/textpattern.com/docs-test/live"

rm -rf $repo_parent_dir/_github-$repo_branch \
&& git clone --branch "$repo_branch" --depth 1 --single-branch $repo_url.git $repo_parent_dir/_github-$repo_branch \
&& cd $repo_parent_dir/_github-$repo_branch \
&& bundle install \
&& bundle exec jekyll build \
&& chown -R www-data:www-data $repo_parent_dir/_github-$repo_branch/ \
&& chmod -R 775 $repo_parent_dir/_github-$repo_branch/ \
&& if [ -f $repo_parent_dir/_github-$repo_branch/README.md ]; then
rm -rf $web_target_dir/ \
&& mkdir -p $web_target_dir/ \
&& mv $repo_source_dir/* $web_target_dir/ \
&& chown -R www-data:www-data $web_target_dir/ \
&& chmod -R 775 $web_target_dir/
fi
