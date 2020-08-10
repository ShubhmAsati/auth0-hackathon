# auth0-hackathon

Solution Theme

Addressing the after-effects of COVID-19

We have designed an android app that can be used to help job seekers to find jobs in remote locations. 
In the after COVID world where contacting with other folks will still be dangerous , It will be hard to find jobs for people. 

# Solution offered :

1. Allowing employers to post job through an app .
2. Allowing job seekers to search jobs based on location. This can be searched in the following category.
    1. From user current location.
    2. User can search for a job type like plumber , carpenter etc. This can be anything .
    3. User can search by locality / landmark  and city. 
4. Job seekers can directly contact employers.

# Technology :

1. Flutter 
2. Java Spring boot
3. Postgres
4. Geolocation

# How it work

1. To use the app user has to register himself . 
2. The Employers can post a job using 'Add Job' button in bottom . This will create a job in our database. The Job data expects location data , job type , expected wage , job timing etc. This helps us to provide accurate results for job seekers.
3. The employers can always see their posted job in 'My Jobs' in the bottom . 
4. The Job Seekers can search for a job based on location + job type.
    1. More about searching process :- 
        1. We search based on latitude and longitude. 
        2. We search all records for a particular radius say 5 km from the search criteria. 
        3. Then sort the records based on nearest to farthest.
        4. As users scroll more and more we increases the radius of the search to fill in more jobs .

# Flutter Server Integration

1.We are using the below ip to connect to server and http package(flutter) to make rest calls in rest_handler.dart file. In this file POST, GET, PUT, DELETE calls through syncPost,syncGet,syncPut,syncDelete methods are made.
<img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/rest.jpg" width="600" height="300">
2.We are storing api paths which are required to connect to respective api's in api_pages.dart file.
3.We are passing these api path, query params, body, headers to rest_handler based on the request type(POST, GET, PUT, DELETE).

# Images

## Register
   <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/register.jpeg" width="350" height="600">

## Login
  <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/login.jpeg" width="350" height="600">
  
## Job Search
   <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/job_search.jpeg" width="350" height="600">
   
## Navigate through the jobs .   
   <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/job_search_home_page.jpeg" width="350" height="600">
   
## Post a Job 
  <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/create_job.png" height="600">
  <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/job_location_add_address.jpeg" width="350" height="600">
       
## My Jobs

  <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/my-jobs.jpeg" width="350" height="600">
  
# Server Installation Steps

## Prerequisites

### Before you continue, ensure you have met the following requirements:

* You have installed the latest version of postgres.
* Keep the username and password as postgres otherwise change it in the application-prod.properties
* You have a amazon aws account.
* You have a access to aws s3 buckets.

## Steps to install:

* create bucket in aws s3.
* create job_portal schema in postgres
* add the following properties in the application-prod.properties

* job.portal.google.geolocation.api.key={YOUR_GOOGLE_API_KEY}
* job.portal.amazon.aws.endpointUrl={YOUR_AMAZON_END_POINT_URL}
* job.portal.amazon.aws.bucketName={YOUR_AMAZON_S3_BUCKET_NAME}
* job.portal.amazon.aws.accessKey={YOUR_AMAZON_USER_ACCESS_KEY}
* job.portal.amazon.aws.secretKey={YOUR_AMAZON_USER_SECRET_KEY}
* job.portal.file.path.images=images/
* spring.servlet.multipart.max-file-size=10MB
* spring.servlet.multipart.max-request-size=40MB

* boot start the server
   
# Note

* The server is host at ip 34.71.141.11
* You can access the apis through link http://34.71.141.11/swagger-ui.html
