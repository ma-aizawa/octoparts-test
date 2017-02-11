#! /bin/sh

for v in `cat version_list.txt`; do
  cat _Gemfile | sed -e "s/@@@@/${v}/" > Gemfile
  bundle update
  bundle exec rspec spec > logs/${v}.txt
done
