import 'dart:ui';
import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/progess_loader/progress_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ndialog/ndialog.dart';

class LoginByMobile extends StatefulWidget {
  @override
  _LoginByMobileState createState() => _LoginByMobileState();
}

class _LoginByMobileState extends State<LoginByMobile> {
  // TextEditingController mobileController = TextEditingController();
  String textValue;
  bool valid;
  Color mobileColor;
  bool mobileDecoration;
  PhoneNumber mobile;

  Color mobileColorChanger(){
    return valid?Colors.teal[500]:Colors.grey;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    valid = false;
    mobileDecoration = true;
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = Progress(context).pr;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          //      appBar: AppBar(
          //        title: Center(
          //          child: Text(
          //            "Demo"
          //          ),
          //        ),
          //        backgroundColor: Colors.grey,
          //      ),
          resizeToAvoidBottomPadding: true,
          backgroundColor: Colors.white,
          body:SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //                  CircleAvatar(
                    //                    backgroundImage: AssetImage("images/covi.jpg"),
                    //                    radius:40
                    //                  ),
                    //                  Container(
                    //                    padding: EdgeInsets.only(left:230),
                    //                    child: RaisedButton.icon(onPressed: (){
                    //                      setState(() {
                    //                          theme = theme?false:true;
                    //                          themeChanger = theme?Colors.white:Colors.black;
                    //                      });
                    //                    },
                    //                        icon: Icon(Icons.threed_rotation)
                    //                        , label: Text("Theme"),
                    //                      shape: RoundedRectangleBorder(
                    //                        borderRadius: BorderRadius.circular(30)
                    //                      ),
                    //                    ),
                    //                  ),
                    SizedBox(height: 20,),
                    Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        )
                    ),
                    SizedBox(height:20.0),
                    //                    CircleAvatar(
                    //                      backgroundImage: AssetImage("images/covi.jpg"),
                    //                      radius: 20,
                    //                    ),
                    //                    SizedBox(height: 80,),
                    Container(
                      margin: EdgeInsets.only(top:80),
                      padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 30,top: 50),
                      //                      decoration: BoxDecoration(
                      //                        color: Colors.grey[200],
                      //                        border: Border.all(
                      //                          color: Colors.black
                      //                        ),
                      //                        borderRadius: BorderRadius.circular(25.0)
                      //                      ),
                      //              margin: EdgeInsets.fromLTRB(35.0, 0.0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: 10
                            ),
                            decoration: mobileDecoration?
                            BoxDecoration(
                              border:  Border.all(
                                  color: Colors.teal[500],
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(25),
                            )
                                :
                            BoxDecoration(
                              border:  Border.all(
                                  color: Colors.red,
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: InternationalPhoneNumberInput(
                              keyboardAction: TextInputAction.done,
                              countries: ['IN','US','GB'],
                              onInputChanged: (PhoneNumber number) async{
                                mobile = number;
                              },
                              onInputValidated: (bool value){
                                print(value);
                                setState(() {
                                  mobileDecoration = value;
                                  valid = value;
                                });
                              },
                              inputDecoration: InputDecoration(
                                hintText: "Enter Mobile Number",
                                border: OutlineInputBorder(
                                    borderSide:BorderSide.none
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,),
                          !mobileDecoration?Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Please Enter Valid Mobile No",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red
                              ),
                            ),
                          ):
                          SizedBox(height: 0,),
                          SizedBox(height: 15.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: (){
                                  if(valid){
                                    goToVerifyOtpScreen();
                                  }
                                },
                                color:mobileColorChanger(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text("Next"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white
                                      ),
                                      child: Icon(
                                          Icons.arrow_forward
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height:10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left:10.0,right:20.0),
                                  child: Divider(
                                    height: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Text("OR",
                                style: TextStyle(
                                    color: Colors.grey
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left:20.0,right:10.0),
                                  child: Divider(
                                    height: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: (){
                                  Navigator.pushReplacementNamed(context, "/register");
                                },
                                color: Colors.teal[500],
                                child: Text(
                                    "Sign Up"
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:20.0),
                  ],
                ),
              ),
            ),
          ),
          //        floatingActionButton: FloatingActionButton(
          //          backgroundColor: Colors.teal[500],
          //          onPressed:(){
          //            setState(() {
          //              theme = theme?false:true;
          //              themeChanger = theme?Colors.white:Colors.black;
          //            });
          //          },
          //          child:Icon(
          //            Icons.gradient,
          //          )
          //        ),
        )
    );
  }
  goToVerifyOtpScreen() {
    LoginRegisterController lg = new LoginRegisterController();
    lg.LoginByMobileNoOtp("+918120387578").then((value) {
      Map<String,dynamic> nextPagePayload = value['data'];
      nextPagePayload['previousPage'] = UiPagesPath.LOGIN_BY_MOBILE;
      nextPagePayload['mobileNo'] = mobile.phoneNumber;
      print(nextPagePayload);
      print(value['nextPage']);
      Navigator.pushNamed(context, value['nextPage'],arguments: nextPagePayload);
    }
    ).catchError((onError) {
     Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
      print("Ooops something terrible happend");
    }
    );
  }
}
