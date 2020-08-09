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
    

# Images

## Register
   Please fill out these details to create an account.
   <img src="https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/register.jpeg" width="350" height="600">
   ![register Screen ](https://github.com/ShubhmAsati/auth0-hackathon/blob/master/images/register.jpeg)
