import 'package:covid_19_job/const/ui_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid_19_job/pages/jobs/job_card.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:covid_19_job/utils/current_location.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:covid_19_job/pages/jobs/jobs_controller.dart';

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
  List<dynamic> activeJobs = new List();
  ScrollController _scrollController = new ScrollController();
  TextEditingController _jobTypeController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _localityController = new TextEditingController();
  Set<double> _mycurrentLatlng;

  int limit = 5;
  int page = 0;
  double jobsOpacity = 1;
  bool _isSearchEnabled = false;
  bool showinitialLoader = true;
  @override
  void initState() {
    super.initState();
    fetchJobsFirstTime(page);
    page++;
//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent) {
//        //reached to the end
//        fetchJobs(page);
//        page++;
//      }
//    });
  }

  @override
  void dispose() {
    super.dispose();
    _jobTypeController.dispose();
    _scrollController.dispose();
    _cityController.dispose();
    _localityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: showinitialLoader?loadProgressLoader():Column(
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
                        width: size.width * .9,
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
                                side: BorderSide(color: Colors.white)),
                            icon: Icon(Icons.search),
                            label: Text('Search Jobs near you')),
                      ),
                    )),
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: activeJobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Opacity(opacity: jobsOpacity, child: JobCard(jobData: activeJobs[index],));
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
    );
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
              controller: _jobTypeController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  labelText: 'Enter anything about the job you are looking for',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            )),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton.icon(
                    onPressed: () async {
                      await setMyCurrentlatLng();
                      print(_mycurrentLatlng);
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
                controller: _localityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    labelText: 'Enter preferred locality/area/nearby things'),
              ),
            ),
            Container(
                child: TextField(
              controller: _cityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
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
                  onPressed: () async {
                    await searchJobs();
                    setState(() {
                      _isSearchEnabled = false;
                      jobsOpacity = 1;
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

  setMyCurrentlatLng() async {
    _mycurrentLatlng = await CurrentLocation.GetLatLng();
  }

  void fetchJobsFirstTime(int page) async {
    JobsController jc = new JobsController();
    Set<double> latLng = await CurrentLocation.GetLatLng();
    jc.GetHomePageJobs(latLng).then((value) {
      print(value);
      if(value['error'].toString().isEmpty){
        setState(() {
          showinitialLoader = false;
          print(value['data']['jobProfileResponses']);
          activeJobs = value['data']['jobProfileResponses'];
        });
      }else{
        showinitialLoader = false;
        activeJobs = [];
      }
    }).catchError((onError) {
      Navigator.pushNamedAndRemoveUntil(
          context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }

  searchJobs() {
    String searchLocationLat, searchLocationLng;
    searchLocationLng = '';
    searchLocationLat = '';
    if (_mycurrentLatlng != null &&_mycurrentLatlng.isNotEmpty&& _mycurrentLatlng.length == 2) {
      searchLocationLat = _mycurrentLatlng.elementAt(0).toString();
      searchLocationLng = _mycurrentLatlng.elementAt(1).toString();
    }
    String jobType = _jobTypeController.text;
    String city = _cityController.text;
    String locality = _localityController.text;
    Map<String, String> queryParams = {
      'latitude': searchLocationLat,
      'longitude': searchLocationLng,
      'jobType': jobType,
      'city': city,
      'area': locality,
      'radius': '40',
    };
    print(queryParams);
    JobsController jc = new JobsController();
    setState(() {
      showinitialLoader = true;
    });
    jc.GetJobBySeachCriteria(queryParams).then((value) {
      print(value);
      setState(() {
        showinitialLoader = false;
      });
    }).catchError((onError) {
      setState(() {
        showinitialLoader=false;
      });
      Navigator.pushNamedAndRemoveUntil(
          context, UiPagesPath.AWW_SNAP, (route) => false);
    });
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

  loadProgressLoader() {
    return Center(
      child: CircularProgressIndicator(
          strokeWidth: 5,
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal)),
    );
  }
}
