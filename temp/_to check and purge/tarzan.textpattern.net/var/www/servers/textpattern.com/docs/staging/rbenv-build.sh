#!/bin/bash
### docs.textpattern.com rbenv + _site build script

### dirs are absolute and mUsT NoT hAvE TrAiLiNg SlAsHeS oR ElSe
repo_url="https://github.com/textpattern/textpattern.github.io"
repo_branch="self-hosted"
repo_parent_dir="/var/www/servers/textpattern.com/docs/staging"
repo_source_dir="/var/www/servers/textpattern.com/docs/staging/_github-self-hosted"
web_target_dir="/var/www/servers/textpattern.com/docs/live/_site"

rm -rf $repo_parent_dir/_github-$repo_branch \
&& git clone --branch "$repo_branch" --depth 1 --single-branch $repo_url.git $repo_parent_dir/_github-$repo_branch \
&& cd $repo_parent_dir/_github-$repo_branch \
&& $HOME/.rbenv/shims/bundle install \
&& $HOME/.rbenv/shims/gem pristine --all \
&& $HOME/.rbenv/shims/bundle exec jekyll build
