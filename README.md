# cs6320_fbapp_gae

## Live Demo
I have the app running on [google app engine](https://1-dot-cs6320-fbapp-imran.appspot.com) . 

## To Run
You would need to use java 1.7 with eclipse and google app engine plugin for eclipse.  
## WARNING
you cannot run this right away, since index.jsp points to actual fb app which is connected to my app. not only that, the [app engine eclipse file](war/WEB-INF/appengine-web.xml) also points to https://1-dot-cs6320-fbapp-imran.appspot.com which is my google app engine account, not yours ;)  
you would have to create your own gae project, and point to the app ID in your eclipse project, ofcourse you need to login to google account via eclipse. 
