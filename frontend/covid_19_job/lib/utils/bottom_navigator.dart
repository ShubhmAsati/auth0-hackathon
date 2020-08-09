import 'package:covid_19_job/const/ui_pages.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * .07,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.tealAccent),
            ),
            color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: FlatButton(
                    onPressed: (){
                      goToJobSearchScreen();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Icon(Icons.home,color: Colors.teal,), Text('Home',style:TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w100,
                        fontSize: 11,
                      ))],
                    ))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: FlatButton(
                  onPressed: (){
                    goToMyJobs();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.inbox,color: Colors.teal,), Text('My Jobs',style:TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ))],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: FlatButton(
                  onPressed: (){
                    goToAddJob();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.add_box,color: Colors.teal,), Text('Add Job',style:TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ))],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child:  FlatButton(
                  onPressed: (){
                    goToUsers();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Icon(Icons.account_circle,color: Colors.teal,), Text('My Profile',style:TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w100,
                      fontSize: 11,
                    ))],
                  )),
            )
          ],
        ));
  }

  void goToMyJobs(){
    Map <String,String> m = {"name": "shubham"};
    Navigator.pushNamed(context,UiPagesPath.MY_JOBS,arguments: m);
    return;
  }
  void goToJobSearchScreen(){
    Map <String,String> m = {"name": "shubham"};
    Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.USER_HOME_PAGE, (route) => false);
    return;
  }

  void goToUsers(){
    Map <String,String> m = {"name": "shubham"};
    Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.MY_PROFILE, (route) => false);
    return;
  }

  void goToAddJob(){
    Map <String,String> m = {"name": "shubham"};
    Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.ADD_JOB, (route) => false);
    return;
  }
}
