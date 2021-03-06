import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/jobs/jobs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covid_19_job/pages/jobs/my_jobs_card.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';

class MyJobs extends StatefulWidget {
  @override
  _MyJobs createState() => _MyJobs();
}

class _MyJobs extends State<MyJobs> {
  /*This page is supposed to have these things
  This is where user will see the jobs posted by others
  1. A top search bar
  2. A list of cards which can be infinite depending upon the response
  3. A bottom navigation bar

   */
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
  int limit = 5;
  int page = 0;
  @override
  void initState() {
    super.initState();
    fetchJobs();

//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent) {
//        //reached to the end
//        fetchJobs();
//        page++;
//      }
//    });
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
            Container(
                height: size.height * 0.08,
                color: Colors.teal[400],
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      )
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                        hintText: 'Search by job title/description ',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600]
                        ),
                        alignLabelWithHint: false,
                        suffixIcon: Icon(
                          Icons.search,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide: BorderSide(),
                        )),
                  ),
                )),
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: activeJobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyJobCard(jobs: activeJobs[index]);
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }

  void fetchJobs() {
    JobsController jc = new JobsController();
    jc.GetMyJobs().then((value) {
      print(value);
      if(value['error'].toString().isEmpty){
        print("hi");
         print(value['data']['jobProfileResponses']);
         setState(() {
           activeJobs = value['data']['jobProfileResponses'];
         });
      }else{
        Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
      }
    }).catchError((onError){
      print(onError);
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
    });

  }

  goToUpdateJob(){
    Map<String, String> m = {"name": "shubham"};
    print('imhere');
    Navigator.pushNamed(context, '/update-job', arguments: m);
    return;
  }
}
