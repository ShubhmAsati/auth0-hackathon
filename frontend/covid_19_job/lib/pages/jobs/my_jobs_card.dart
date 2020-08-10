import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MyJobCard extends StatefulWidget {
  dynamic jobs ;
  MyJobCard({this.jobs});
  @override
  _MyJobCardState createState() => _MyJobCardState(jobs: jobs);
}

class _MyJobCardState extends State<MyJobCard> {
  dynamic jobs;
  _MyJobCardState({this.jobs});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(jobs);
    print(jobs['jobType']);
    print("helspdpsd");
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  width: size.width,
                  child: Text(
                      ' ${jobs['jobType']}',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          color: Colors.grey[850]
                      ))),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                  width: size.width,
                  child: Text(
                      ' ${jobs['jobDescription']}',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                      ))
              ),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                  width: size.width,
                  child: Text(
                    ' ${jobs['jobDescription']}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[800],
                    ),
                  )
              ),
            ),
            //this is optional we should make it conditional
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  width: size.width,
                  height: size.height*.12,
                  child: Image(
                    image: AssetImage('assets/app_logo.jpg'),
                  )
              ),
            ),
            Flexible(
              child: Container(
                height: size.height*.1,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                        child:Text(
                            'Expected price/perday ${jobs['wageLowLimit']} to ${jobs['wageHighLimit']}'
                        )
                    ),
                    FlatButton.icon(
                        onPressed: (){
                          goToUpdateJob();
                        },
                        icon: Icon(
                          Icons.edit,
                        ),
                        label: Text(
                            'Edit',
                            style: TextStyle(
                                color: Colors.blue
                            )
                        )
                    ),
                    FlatButton.icon(
                        onPressed: (){},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        label: Text(
                            'Delete',
                            style: TextStyle(
                                color: Colors.red
                            )
                        )
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  goToUpdateJob(){
    Map<String, String> m = {"name": "shubham"};
    print('imhere');
    Navigator.pushNamed(context, '/update-job', arguments: m);
    return;
  }
}


