# bittask

Installation

```
git clone git@github.cbhq.net:engineering/bittask.git
# install postgres
rake db:create
rake db:reset
```

Set up subdomains with Pow
```
curl get.pow.cx | sh
cd ~/.pow
ln -s ~/code/bittask
```
The last line should use a link to your local directory