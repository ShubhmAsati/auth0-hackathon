import 'package:flutter/material.dart';

class AwwSnap extends StatefulWidget {
  @override
  _AwwSnapState createState() => _AwwSnapState();
}

class _AwwSnapState extends State<AwwSnap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    flex: 21,
                    child: SizedBox(
                        width:20
                    ),
                  ),
//                  Expanded(
//                    flex: 4,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          color: Colors.deepOrange,
//                          border: Border.all(
//                              color: Colors.white,
//                              width: 2
//                          )
//                      ),
//                      child: Text("4",
//                        style: TextStyle(
//                          fontSize: 40,
//                          fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 4,
//                    child: Container(
//                      margin: EdgeInsets.only(top:10),
//                      decoration: BoxDecoration(
//                        color: Colors.deepOrange,
//                        border: Border.all(
//                            color: Colors.white,
//                            width: 2
//                        )
//                      ),
//                      child: Text("0",
//                        style: TextStyle(
//                          fontSize: 40,
//                          fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 4,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          color: Colors.deepOrange,
//                          border: Border.all(
//                              color: Colors.white,
//                              width: 2
//                          )
//                      ),
//                      child: Text("4",
//                        style: TextStyle(
//                          fontSize: 40,
//                          fontWeight: FontWeight.bold
//                        ),
//                      ),
//                    ),
//                  ),
                  Expanded(
                    flex:21,
                    child: Image(
                      image: AssetImage("assets/snap.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    flex: 21,
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
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  RaisedButton(
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(25)
//                    ),
//                    onPressed: (){
//
//                    },
//                    color: Colors.teal[500],
//                    child: Row(
//                      children: <Widget>[
//                        Container(
//                          decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              color: Colors.white,
//                          ),
//                          child: Icon(
//                              Icons.arrow_back
//                          ),
//                        ),
//                        SizedBox(
//                          width: 5,
//                        ),
//                        Text("Back To Previous Page"),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//              Expanded(
//                flex: 3,
//                child: SizedBox(
//                  height: 0,
//                ),
//            ),
            ],
          ),
        ),
      ),
    );
  }
}
