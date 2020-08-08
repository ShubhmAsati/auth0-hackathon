import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/current_location.dart';

class SearchJobs extends StatefulWidget {
  @override
  _SearchJobsState createState() => _SearchJobsState();
}

class _SearchJobsState extends State<SearchJobs> {
  CurrentLocation userLocation = new CurrentLocation();
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity:0,
      child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Enter anything about the job you are looking for',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  alignment: Alignment.center,
                  child: RaisedButton.icon(
                    onPressed: (){print('hi');
                    userLocation.getLatLng();
                    },

                    color: Colors.white,
                    icon: Icon(
                      Icons.my_location,
                    ),
                    label: Text(
                        'Use my current location'
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 80),
                  )
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left:10.0,right:20.0),
                      child: Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text("OR",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left:20.0,right:10.0),
                      child: Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Enter preferred locality/area/nearby things'
                  ),
                ),
              ),
              Container(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Enter city',
                    ),
                  )
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left:10.0,right:20.0),
                      child: Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text("OR",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left:20.0,right:10.0),
                      child: Divider(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  child: RaisedButton.icon(
                    onPressed: (){

                    },

                    color: Colors.white,
                    icon: Icon(
                      Icons.add_location,
                    ),
                    label: Text(
                        'Pick Location from map'
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 80),
                  )
              ),
              Container(
                  child: RaisedButton(
                    onPressed: (){

                    },

                    color: Colors.teal,
                    child: Text('Search',style: TextStyle(
                        color: Colors.white
                    ),),
                    padding: EdgeInsets.symmetric(vertical: 7,horizontal: 80),
                  )
              )
            ],
          )
      ),
    );
  }
}
