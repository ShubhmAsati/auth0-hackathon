import 'package:covid_19_job/const/ui_pages.dart';
import 'package:flutter/material.dart';

class AwwSnap extends StatefulWidget {
  @override
  _AwwSnapState createState() => _AwwSnapState();
}

class _AwwSnapState extends State<AwwSnap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Error"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal[500],
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white
            )
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex:8,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width:20
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Image(
                      image: AssetImage("assets/snap.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width:20
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Oops!",
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.grey
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                  Expanded(
                    flex:4,
                    child: Text("Something went wrong...",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 15,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, UiPagesPath.APP_OPENING);
                    },
                    color: Colors.teal[500],
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                          ),
                          child: Icon(
                              Icons.arrow_back
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Back To Home Page"),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 0,
                ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
