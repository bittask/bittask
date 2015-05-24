# bittask

Installation

```
brew install postgresql
git clone git@github.com:bittask/bittask.git
cd bittask
bundle install
gem uninstall pg
gem install pg # this is for some reason needed for the pg gem to detect the location of postgresql installed with home brew
rake db:create
rake db:reset
```
