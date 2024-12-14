# A.I.M-Cash-Of-Codes-
For Clash of Codes Hackathon, Remote cardiac monitoring and prevention system...

# Note:- This application is in the development stage, some functions may not work fully...**


********************************************************************************************************************************************************

# Sign In Page Credentials
Username - Doc@123
Password - carethru

# In Home Page 
Using the + at the centre bottom of the home page, we can create a new Patient ID
home page is divided into two parts the left patient side, and right patient data .

the application recives real time live data from the sensor and 
the machine learning model predicts a possible heart attack 5 to 10min before it occurs.

patient data comprises of their personal info and an Ecg graph, 
for demo purposes the 2nd patient has been hard coded. below the ECG graph of the 2nd patient the
'analyse' button give live analysis of the data through Chat Gpt integration.

all the data is securly stored in mongoDB database(google cloud).

#'assest' file in software branch has the accuracy reports and a walkthrough of the Windows application.
********************************************************************************************************************************************************

# Code in Arduino
Board - ESP32
Sensor - AD8232 ECG Sensor
Database - Mongo DB

# Dataflow
ECG Reads Data ---->  Sends in the form of Arrays Voltage VS Time  ----> ESP hosts a webserver in the WiFi Network ----> ESP sends the data to flutter Application ----> Where the real-time data is analysed for any potential heart attacks ----> Then stores the patient data in Mongo DB Database ie (Google Cloud)
                                              
