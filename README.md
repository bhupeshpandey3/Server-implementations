# Dipper-Api

##Problem Statement 

Implement a server which should be capable of doing the following:

   - Exposes a GET API as "api/request?connId=19&timeout=80" 

 This API will keep the request running for provided time on the server side. After 

the successful completion of the provided time it should return {"status":"ok"}

   - Exposes a GET API as "api/serverStatus" 

 This API returns all the running requests on the server with their time left for 

completion. E.g {"2":"15","8":"10"} where 2 and 8 are the connIds and 15 and 10 

is the time remaining for the requests to complete (in seconds).

   - Exposes a PUT API as "api/kill" with payload as {"connId":12} 

This API will finish the running request with provided connId, so that the finished 

request returns {"status":"killed"} and the current request will return 

{"status":"ok"}. If no running request found with the provided connId on the server 

then the current request should return "status":"invalid connection Id : <connId>"}

## Rails Version
Version of rails used in this project is 4.2.2 .A gem file containing the version numbers of each gem used in this application is present. 

##Installation

To install rails in linux based system follow the following guide: http://railsapps.github.io/installrubyonrails-ubuntu.html
Windows and Mac OS users refer to: http://railsinstaller.org/en 

## Contributing
Follow the following steps to setup the api in development environment:

##Setup dipper-api in development environment for linux

1. Clone the repository by running the following command:     
  
         git clone https://github.com/shlok007/dipper-api 

2. Move inside the directory of dipper-api:
         
         cd dipper-api

3. Run the following to install all required gems:
         
         bundle install

5. Launh Puma server by running:
         
         rails server puma

6. All set now. 

###Example

1. [http://localhost:3000/api/request?connId=19&tiomeout=60][localhost1] to create a new request.

2. [http://localhost:3000/api/serverStatus][localhost2] to show the server status

3. **http://localhost:3000/api/kil?connId=19** with payload as {"connId":"19"} to kill the ongoing request with id 19.

[localhost1]:http://localhost:3000/api/request?connId=19&tiomeout=60
[localhost2]:http://localhost:3000/api/serverStatus
