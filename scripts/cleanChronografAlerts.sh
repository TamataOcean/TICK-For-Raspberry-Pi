# CHRONOGRAF - Clean UP History events and keep history from last 2 days.
influx -execute "delete from alerts where time < now() -48h " -database="chronograf"
