import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Text(
                    'Job Location',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    alignment: Alignment.center,
                    child: RaisedButton.icon(
                      onPressed: (){

                      },

                      color: Colors.white,
                      icon: Icon(
                        Icons.my_location,
                      ),
                      label: Text(
                          'Use my current location'
                      ),
                      padding: EdgeInsets.symmetric(vertical: 7,horizontal: 80),
                    )
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left:10.0,right:20.0),
                        child: Divider(
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text("OR",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left:20.0,right:10.0),
                        child: Divider(
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: size.width*0.4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.teal[500]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Alternate mobile',
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: size.width*0.4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.teal[500]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Contact person name',
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: size.width*0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.teal[500]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'Pincode',
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: size.width*0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.teal[500]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.teal[500],
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'City',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: size.width*0.4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.teal[500]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'State',
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: size.width*0.4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.teal[500]),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[500],
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              labelText: 'Country',
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.teal[500]),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: 'Landmark',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      minLines: 2,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.teal[500]),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal[500],
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Job location Address',
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                  child: RaisedButton(
                      onPressed: (){
                      },
                      elevation: 15,
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                      child: Text(
                        'Submit Job',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                  ),
                )

              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavigator(),

    );
  }
}
