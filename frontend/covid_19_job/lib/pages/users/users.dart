import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:covid_19_job/utils/utils.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool _firstNameEnabled = false;
  bool _lastNameEnabled = false;
  bool _emailEnabled = false;
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode stateFocus = FocusNode();
  FocusNode addressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentScope = FocusScope.of(context);
        if(!currentScope.hasPrimaryFocus){
          currentScope.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SingleChildScrollView(
          child: SafeArea(
              child:Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                child: SizedBox(
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
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
                                      focusNode: firstNameFocus,
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (value){
                                        Utils.fieldFocusChange(context, firstNameFocus, lastNameFocus);
                                      },
                                      decoration: InputDecoration(
                                        focusColor: Colors.teal,
                                        hintText: 'Enter First Name',
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                        labelText: 'Firstname',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.grey
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
                                      textInputAction: TextInputAction.next,
                                      focusNode: lastNameFocus,
                                      onFieldSubmitted: (value){
                                        Utils.fieldFocusChange(context, lastNameFocus, emailFocus);
                                      },
                                      decoration: InputDecoration(
                                        focusColor: Colors.teal,
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                        labelText: 'Lastname',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        hintText: "Enter Last Name",
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
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                            width: size.width*.9,
                            child: TextFormField(
                                textInputAction: TextInputAction.next,
                                focusNode: emailFocus,
                                onFieldSubmitted: (value){
                                  Utils.fieldFocusChange(context, emailFocus, cityFocus);
                                },
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
//                                contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey
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
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      onFieldSubmitted: (value){
                                        Utils.fieldFocusChange(context, cityFocus, stateFocus);
                                      },
                                      focusNode: cityFocus,
                                      decoration: InputDecoration(
                                        focusColor: Colors.teal,
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                        labelText: 'City',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        hintText: "Enter City",
                                        hintStyle: TextStyle(
                                            color: Colors.grey
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
                                      textInputAction: TextInputAction.next,
                                      focusNode: stateFocus,
                                      onFieldSubmitted: (value){
                                        Utils.fieldFocusChange(context, stateFocus, addressFocus);
                                      },
                                      decoration: InputDecoration(
                                        focusColor: Colors.teal,
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                        labelText: 'State',
                                        labelStyle: TextStyle(
                                            color: Colors.grey
                                        ),
                                        hintText: "Enter State",
                                        hintStyle: TextStyle(
                                            color: Colors.grey
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
                            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                            width: size.width*.9,
                            child: TextFormField(
                                textInputAction: TextInputAction.done,
                                focusNode: addressFocus,
                                decoration: InputDecoration(
                                  focusColor: Colors.teal,
//                                contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                  labelText: 'Address',
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: "Enter Address",
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
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 5),
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
                      Expanded(
                          child: SizedBox(
                            height: 10,
                          )
                      )

                    ],
                  ),
                ),
              )
          ),
        ),
        bottomNavigationBar: BottomNavigator(),
      ),
    );
  }
}
