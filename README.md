# cs6320_fbapp_gae

## Introduction
THis is the exercise for creating an FB app for posting status on a user's timeline where the app runs on GAE. This project has to be run from eclipse.

## Submission details

submitted by:
```
Muhammad Imran Malik
Net ID: wm6952
CSU East Bay 
CS6320 Spring 2017
```

## Live Demo
I have the app running on [google app engine](https://1-dot-cs6320-fbapp-imran.appspot.com) . 

## To Run
You would need to use java 1.7 with eclipse and google app engine plugin for eclipse.  

## Requirements

Following are the requirements needed to run :
* have a developers.facebook account
* create an app on fb
* install eclipse, java jdk 1.7, and install google app engine eclipse
* create a project on app engine and set the project ID to the GAE project ID in eclipse 
* set the app_ID of facebook under <script> accordingly 


## WARNING
you cannot run this right away, since index.jsp points to actual fb app which is connected to my app. not only that, the [app engine eclipse file](war/WEB-INF/appengine-web.xml) also points to https://1-dot-cs6320-fbapp-imran.appspot.com which is my google app engine account, not yours ;)  
you would have to create your own gae project, and point to the app ID in your eclipse project, ofcourse you need to login to google account via eclipse. 
