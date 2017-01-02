# parking-nr
This is the microservices runtime for the parking demo. 

It contains services to retrieve data from the integrated parking systems as well as the Watson 
related image capturing and training capabilities.

The following JSON snippets are the code for the actual service implementation

##Deploy
[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/KKaski/parking.git/parking-nr#[required])


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