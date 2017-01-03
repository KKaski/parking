#parking-an

This is a light analytics piece for the parking application. The purpose of the content is to provide fast overview
of some bluemix analytics capabilities you can use.

##Setup and run
1. Create and Bind dashDB to the parking-nr application
2. Create warehouse link from cloudant to dashDB. This creates schema and start moving the data
3. Open dashDB console and observe the tables created for you
4. Load some data from earlier implementations by loading testdata.csv to your instance
5. Go to the Analytic/ R Script
6. Copy the content from the ParkingScript.r to the edit area and press sbmit
7. Explore the script and the out put
8. You can allso open RStudi environment where you can get nicer plots. If the environment asks for userids you can get them from the connect section of the dashDB console.


##Warehousing
1. Open Cloudant admin console
2. Select analytics tables
3. Create warehouse
4. Select dashDB
4. Login / provide Bluemix credentials
5. Provide warehouse name (parkingwh)
6. Datasources. Write the cloudan database name plugitchargers 
7. Select the dashDB service instance
8. Cick Create Warehouse 
9. Wait for the Warehousing to start
10. Open dashDB console from the Warehouses list