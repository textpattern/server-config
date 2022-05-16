#!/bin/bash
### docs.textpattern.com site build script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/textpattern/textpattern.github.io"
repo_branch="self-hosted"
repo_parent_dir="/var/www/servers/textpattern.com/docs-test/staging"
repo_source_dir="/var/www/servers/textpattern.com/docs-test/staging/_github-self-hosted"
web_target_dir="/var/www/servers/textpattern.com/docs-test/live/_site"

rm -rf $repo_parent_dir/_github-$repo_branch \
&& git clone --branch "$repo_branch" --depth 1 --single-branch $repo_url.git $repo_parent_dir/_github-$repo_branch \
&& cd $repo_parent_dir/_github-$repo_branch \
&& ~/.rbenv/shims/bundle exec jekyll build
if [ -f $repo_parent_dir/_github-$repo_branch/_site/index.html ]; then
rm -rf $web_target_dir/ \
&& echo "Moving files into place..." \
&& mkdir -p $web_target_dir/ \
&& mv $repo_source_dir/_site/* $web_target_dir/ \
&& echo "Done."
fi
