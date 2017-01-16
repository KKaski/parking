# Parking Demo User Interface (parking-gui)
This is demo application using IBM Bluemix and Meteor framework to create responsive IoT application. It uses Node-Red based microservices to connect to the physical world. 

This project is the user interface layer for the end users. 

**Note: This application uses buildback from https://github.com/KKaski/cf-meteor-buildpack.git to freeze 
the meteor version for now. When writing this version 1.4.2.3 was realeased which broked down the deployment in Bluemix.*

**There is now manifest file added so you can push the application by simply typing cf push*

###### H6 Note! Use your own application name to avoid overlapping hostnames in public Bluemix environment

##Deploy
**Edit the Manifest.yml**
*Edit the Manifest.yml and give the application unique hostname for example using your initials in it*

**Add Mongo service to the space using the following command**  
*cf create-service mongodb 100 parking-mongodb*  

**To push this application Bluemix navigate to the ui application folder and type**  
*cf push*  


##Code changes
*This is the piece we need to edit to make GUI to communicate with your Node-Red flow*
1. parking-gui.js
Change the Node-Red Microservice endpoint to point your services. Find the following line.
var result = HTTP.call("GET", "https://parking-nr.mybluemix.net/simulate?output=json",{});

