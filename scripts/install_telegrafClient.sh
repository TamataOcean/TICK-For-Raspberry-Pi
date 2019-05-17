# Script Install for Clients ( MAC USERS ) 

# Using Brew 
# ----------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install telegraf

cd /usr/local/etc/
mv telegraf.conf telegraf.conf.SAV

# Config
curl -O -u "" "smb://raspinas.local/DEPLOYTOOLS/telegraf/telegraf.conf"
brew services restart telegraf
