import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid_19_job/pages/jobs//job_card.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:covid_19_job/utils/current_location.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobSearchHomePage extends StatefulWidget {
  @override
  _JobSearchHomePageState createState() => _JobSearchHomePageState();
}

class _JobSearchHomePageState extends State<JobSearchHomePage> {
  /*This page is supposed to have these things
  This is where user will see the jobs posted by others
  1. A top search bar
  2. A list of cards which can be infinite depending upon the response
  3. A bottom navigation bar

   */

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  CurrentLocation userLocation = new CurrentLocation();
  List<String> jobsPosted = [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eight",
    "nine",
    "ten",
    "11"
  ];
  List<String> activeJobs = new List();
  ScrollController _scrollController = new ScrollController();
  int limit = 5;
  int page = 0;
  double jobsOpacity = 1;
  bool _isSearchEnabled = false;
  @override
  void initState() {
    super.initState();
    fetchJobs(page);
    page++;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //reached to the end
        fetchJobs(page);
        page++;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _isSearchEnabled
                ? getFloatingSearchBar()
                : Container(
                height: size.height * 0.08,
                color: Colors.teal[400],
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: size.width*.9,
                    child: RaisedButton.icon(
                        color: Colors.white,
                        elevation: 15,
                        onPressed: () {
                          setState(() {
                            _isSearchEnabled = true;
                            jobsOpacity = .3;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)
                        ),
                        icon: Icon(Icons.search),
                        label: Text('Search Jobs near you')),
                  ),
                )),
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: activeJobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Opacity(opacity:jobsOpacity,child: JobCard());
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }

  void fetchJobs(int page) {
    print(page);
    int start = page * limit;
    setState(() {
      for (int i = start; i < start + limit && i < jobsPosted.length; i++) {
        activeJobs.add(jobsPosted[i]);
      }
    });
  }

  getFloatingSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Opacity(
        opacity: 1,
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          labelText: 'Enter anything about the job you are looking for',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          )),
                    )),
                Row(
                  children : <Widget>[
                    Expanded(
                      child: RaisedButton.icon(
                        onPressed: () {
                          CurrentLocation.GetLatLng();
                        },
                        color: Colors.white,
                        icon: Icon(
                          Icons.my_location,
                        ),
                        label: Text('Use my current location'),
                        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 80),
                      ),
                    ),
                    ]
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 10.0),
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
                        contentPadding:const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        labelText: 'Enter preferred locality/area/nearby things'),
                  ),
                ),
                Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding:const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                        labelText: 'Enter city',
                      ),
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 10.0),
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
//                      onPressed: null,() {
//                        print("hi");
//                        openMap(context);
//                      },
                      color: Colors.white,
                      icon: Icon(
                        Icons.add_location,
                      ),
                      label: Text('Pick Location. (Not enabled due to billing)'),
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _isSearchEnabled = false;
                          jobsOpacity =1;
                        });
                      },
                      color: Colors.teal,
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    ))
              ],
            )),
      ),
    );
  }


//  openMap(context) {
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => PlacePicker(
//          apiKey: 'AIzaSyDk5nVsq3j9ijsA5i2NChTo8PhYcq7YzeY', // Put YOUR OWN KEY here.
//          onPlacePicked: (result) {
//            print(result);
//            print('i');
//            Navigator.of(context).pop();
//          },
//          initialPosition: kInitialPosition,
//          useCurrentLocation: true,
//        ),
//      ),
//    );
//  }
}
