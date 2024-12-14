# A.I.M-Cash-Of-Codes-
For Clash of Codes Hackathon, Remote cardiac monitoring and prevention system...

# Note:- This application is in the development stage, some functions may not work fully...**


********************************************************************************************************************************************************

# Sign In Page Credentials
Username - Doc@123
Password - carethru

# In Home Page 
Using the + at the centre bottom of the home page, we can create a new Patient ID

#

********************************************************************************************************************************************************

# Code in Arduino
Board - ESP32
Sensor - AD8232 ECG Sensor
Database - Mongo DB

# Dataflow
ECG Reads Data ---->  Sends in the form of Arrays Voltage VS Time  ----> ESP hosts a webserver in the WiFi Network ----> ESP sends the data to flutter Application ----> Where the real-time data is analysed for any potential heart attacks ----> Then stores the patient data in Mongo DB Database ie (Google Cloud)
                                              
