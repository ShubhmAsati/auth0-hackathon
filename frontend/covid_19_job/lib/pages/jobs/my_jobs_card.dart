import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MyJobCard extends StatefulWidget {
  Map<String,String> jobs = new Map();
  MyJobCard({this.jobs});
  @override
  _MyJobCardState createState() => _MyJobCardState(jobs: jobs);
}

class _MyJobCardState extends State<MyJobCard> {
  Map<String,String> jobs = new Map();
  _MyJobCardState({this.jobs});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      'Job Title',
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
                      'Job Description. we will add wages here itself',
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
                    'Address which is very  very long around 100 characters long , this is to peint',
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
                            'Expected price/perday'
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


