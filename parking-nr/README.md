# parking-nr
This is the microservices runtime for the parking demo. 

It contains services to retrieve data from the integrated parking systems as well as the Watson 
related image capturing and training capabilities.

##Bluemix environment variables
Edit the manifest file and change the hostname to be uniqui in Bluemix context. Add for example your initials to the begininig of the hostname

Define the following environment variables. Note that the spaces and indents needs to be exactly as in the file. Do not change indents or spaces.

1. NODE_RED_USERNAME: <Your Value>
2. NODE_RED_PASSWORD: <Your value>
3. NODE_TLS_REJECT_UNAUTHORIZED: 0
4. PLUGIT_USERNAME: <ask from isntructor>
5. PLUGIT_PASSWORD: <ask from instructor>

##Deploy
*cf cs cloudantNoSQLDB Lite parking-nr-cloudantNoSQLDB*
###If not done allready
*cf create-service mongodb 100 parking-mongodb*
*cf push*

##Service bindings
1. Bind the mongodb service created with parking-gui to the application (if not done allread)
2. Create Watson Visual Recognition service and bind it to the application
3. Create dashDB service and bind it to the application (only needed for analytics)

##Code changes
These code changes has been done to the boilerplate code (no need to do).
1. bluemix-settings.js
There is a change in this file to allow node-red flow to use jimp for cropping and to get 
access to the environment variable in Bluemix

   //This is required to add jimp functionality to the code
    functionGlobalContext: { Jimp : require("jimp"), process: process},

##Flows
This application has the default flows copied in to the defaults directory. go to the defaults directory and take a look on the flow.json file.

When Node-Red starts in the first time some of the content needs to be tuned to make the flows work. Remove the undefined node.

1. Menu / Configuration Nodes
2. Remove the last undefined node
3. Deploy your flows

##Watson training
The image material used for the Watson Visual Recognition service can be found under the 
public/training folder. From the folder you can find the original images as well as the precreated .zip packages
which are used o train th Watson service.

Easiest way to train Watson is by usin curl from the command line.

1. Create new Watson Visual Recognition service and bind it to you Node-Red runtime
2. Copy the API keys from your service
3. Change to the directory where the training images are stored.
4. Use the following command (replace <yourkey> qith your api key)

curl -X POST -F freeparking_positive_examples=@Positive.zip -F negative_examples=@Negative.zip -F name=freeparking "https://gateway-a.watsonplatform.net/visual-recognition/api/v3/classifiers?api_key=<yourkey>&version=2016-05-20"

##Watson additional training
The public/training directory contains file called AdditionalImages.zip. This file has aproximatly 1000 additional images which can be used to further train the images. Some ides for additional training could be to have finer grained classes inside the calssifier for exampl full, crowdy, free