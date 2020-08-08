import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JobCard extends StatefulWidget {
  Map<String, String> jobData;
  JobCard({this.jobData});

  @override
  _JobCardState createState() => _JobCardState(jobData: jobData);
}

class _JobCardState extends State<JobCard> {
  Map<String, String> jobData;
  _JobCardState({this.jobData});

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
                  height: size.height * .06,
                  width: size.width,
                  child: Container(
                    height: size.height * .3,
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ListTile(
                      leading: Image(
                        image: AssetImage('assets/app_logo.jpg'),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.message,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                            child: Icon(
                              Icons.call,
                            ),
                          )
                        ],
                      ),
                      title: const Text('Posted By'),
                      subtitle: Text(
                        'Profession',
                        style:
                        TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  )),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70,  0,0,0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
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
                    FlatButton(
                        onPressed: (){},
                        child: Icon(
                            Icons.location_on,
                            semanticLabel:'Check location on map'
                        )
                    ),
                    FlatButton(
                        onPressed: (){},
                        child: Text(
                            'Accept',
                            style: TextStyle(
                                color: Colors.green
                            )
                        )
                    ),
                    FlatButton(
                        onPressed: (){},
                        child: Text(
                            'Reject',
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
}
