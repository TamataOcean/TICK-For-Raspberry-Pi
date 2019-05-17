# Script Install for Raspberry Pi 
# -------------------------------
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apt-transport-https
sudo apt-get install curl
echo "Update / upgrade your system done"

# Install Telegraf
# ----------------
sudo aptitude install telegraf
sudo systemctl enable telegraf
sudo systemctl start telegraf
# Config
sudo mv /etc/telegraf/telegraf.conf /etc/telegraf/telegraf.conf.SAV
sudo cp ../conf/telegraf.conf /etc/telegraf/telegraf.conf
sudo systemctl restart telegraf
echo "telegraf installed"


# InfluxDB
# -------- 
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list 
sudo apt-get update
sudo apt-get install influxdb
# Config
sudo mv /etc/influxdb/influxdb.conf /etc/influxdb/influxdb.conf.SAV
sudo cp ../conf/influxdb.conf /etc/influxdb/influxdb.conf
sudo service influxdb restart
echo "InfluxDB installed"

# Create InfluxDB databases
./scripts/create_InfluxDB_databases.sh

# install Chronograf
# ------------------
sudo aptitude install chronograf
echo "Chronograf installed"

# install Kapacitor
# -----------------
sudo aptitude install kapacitor
# Config
sudo mv /etc/kapacitor/kapacitor.conf /etc/kapacitor/kapacitor.conf.SAV
sudo cp ../conf/kapacitor.conf /etc/kapacitor/kapacitor.conf
echo "Kapacitor installed"
