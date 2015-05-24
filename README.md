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

Note that this project is an experiment/proof of concept.
If you'd like to take over development of BitTask please fork it or post a message on [http://www.reddit.com/r/bittask/](http://www.reddit.com/r/bittask/)