import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool _firstNameEnabled = false;
  bool _lastNameEnabled = false;
  bool _emailEnabled = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'My Profile',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    height: 250,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/app_logo.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: 'FirstName',
                                  labelStyle: TextStyle(
                                      color: Colors.teal[500]
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                )
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: 'Lastname',
                                  labelStyle: TextStyle(
                                      color: Colors.teal[500]
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 1),
                      width: size.width*.9,
                      child: TextFormField(
                          decoration: InputDecoration(
                            focusColor: Colors.teal,
                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Colors.teal[500]
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          )
                      )
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: 'City',
                                  labelStyle: TextStyle(
                                      color: Colors.teal[500]
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                )
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  labelText: 'State',
                                  labelStyle: TextStyle(
                                      color: Colors.teal[500]
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal[500],
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 2.0,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 1),
                      width: size.width*.9,
                      child: TextFormField(
                          decoration: InputDecoration(
                            focusColor: Colors.teal,
                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Colors.teal[500]
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          )
                      )
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: RaisedButton(
                      color: Colors.teal,
                      onPressed: (){},
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                      height: 10,
                    )
                )

              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
