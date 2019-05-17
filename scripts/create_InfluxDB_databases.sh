# Create InfluxDB databases for telegraf 
# --------------------------------------

# Admin user to access to databases
influx -execute "CREATE USER telegraf_admin WITH PASSWORD 'pirate'"

# SERVER RaspiNAS
influx -execute "CREATE DATABASE telegraf"
influx -execute "GRANT ALL ON telegraf TO telegraf_admin"
influx -execute "CREATE RETENTION POLICY "a_year" ON "telegraf" DURATION 52w REPLICATION 1 DEFAULT"

echo "Database telegraf created on InfluxDB"