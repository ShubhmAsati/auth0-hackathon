import 'dart:async';

import 'package:covid_19_job/const/ui_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';

class VerifyLoginOtp extends StatefulWidget {
  @override
  _VerifyLoginOtpState createState() => _VerifyLoginOtpState();
}

class _VerifyLoginOtpState extends State<VerifyLoginOtp> {
  Map dataFromPreviousPage = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataFromPreviousPage = ModalRoute.of(context).settings.arguments;
    if (!(dataFromPreviousPage.containsKey('mobileNo') &&
        dataFromPreviousPage.containsKey('userId'))) {
      Navigator.pop(context);
    }
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Enter Otp'),
          centerTitle: true,
          backgroundColor: Colors.teal[400],
        ),
        backgroundColor: Colors.white,
        body: ScaffoldWidget(dataFromPreviousPage: dataFromPreviousPage));
  }
}

class ScaffoldWidget extends StatefulWidget {
  var dataFromPreviousPage;
  ScaffoldWidget({this.dataFromPreviousPage});
  @override
  _ScaffoldWidgetState createState() =>
      _ScaffoldWidgetState(dataFromPreviousPage: dataFromPreviousPage);
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  var dataFromPreviousPage;
  int _startTime = 120;
  countDownTimer() async {
    for (int x = _startTime; x > 0; x--) {
      await Future.delayed(Duration(seconds: 1)).then((_) {
        setState(() {
          _startTime -= 1;
        });
      });
    }
  }

  _ScaffoldWidgetState({this.dataFromPreviousPage});

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
  TextEditingController currController = new TextEditingController();
  bool _isConfirmOtpEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currController = controller1;
    countDownTimer();
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Flexible(
            flex: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  child: Text("Verify your mobile number",
                      style: TextStyle(fontSize: 18, fontFamily: 'Roboto')),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  child: Text("Please type verification code sent to ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w300,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  child: Text(dataFromPreviousPage['mobileNo'],
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/otp-icon.png'),
                      height: 120,
                      width: 120,
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 10,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GridView.count(
                    crossAxisCount: 8,
                    mainAxisSpacing: 30,
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    children: <Padding>[
                      Padding(
                        padding: EdgeInsets.only(left: 0.0, right: 2.0),
                        child: new Container(
                          color: Colors.transparent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[200], //Color.fromRGBO(0, 0, 0, 0.1),
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller1,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller2,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller3,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller4,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller5,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextField(
                              enabled: false,
                              controller: controller6,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0, right: 0.0),
                        child: new Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 30.0, horizontal: 80),
                      child: RaisedButton(
                          color: Colors.teal[600],
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          onPressed: _isConfirmOtpEnabled
                              ? () {
                                  confirmOTP();
                                }
                              : null,
                          child: Container(
                              child: Text(
                            'Confirm',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              letterSpacing: 4,
                              color: Colors.white,
                            ),
                          )))),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                          onPressed: _startTime == 0
                              ? () {
                                  resetOtp();
                                }
                              : null,
                          color: Colors.white,
                          child: Text(
                            _startTime == 0
                                ? 'Resend Otp'
                                : 'Retry in $_startTime',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 3,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.teal[600],
                            ),
                          )),
                      FlatButton(
                          onPressed: () {
                            goToPasswordScreen();
                          },
                          color: Colors.white,
                          child: Text(
                            'Use password',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 3,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Colors.teal[600],
                            ),
                          ))
                    ],
                  ))
                ]),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 16.0, right: 8.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("1");
                          },
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("2");
                          },
                          child: Text("2",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("3");
                          },
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("4");
                          },
                          child: Text("4",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("5");
                          },
                          child: Text("5",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("6");
                          },
                          child: Text("6",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("7");
                          },
                          child: Text("7",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("8");
                          },
                          child: Text("8",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("9");
                          },
                          child: Text("9",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 4.0, right: 8.0, bottom: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MaterialButton(
                            child: Container(
                          color: Colors.transparent,
                        )),
                        MaterialButton(
                          onPressed: () {
                            inputTextToField("0");
                          },
                          child: Text("0",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center),
                        ),
                        MaterialButton(
                            onPressed: () {
                              deleteText();
                            },
                            child: Icon(Icons.clear)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            flex: 0,
          ),
        ])));
  }

  void inputTextToField(String str) {
    //Edit first textField
    if (currController == controller1) {
      controller1.text = str;
      controller1.value = TextEditingValue(text: str);
      currController = controller2;
    }

    //Edit second textField
    else if (currController == controller2) {
      controller2.text = str;
      currController = controller3;
    }

    //Edit third textField
    else if (currController == controller3) {
      controller3.text = str;
      currController = controller4;
    }

    //Edit fourth textField
    else if (currController == controller4) {
      controller4.text = str;
      currController = controller5;
    }

    //Edit fifth textField
    else if (currController == controller5) {
      controller5.text = str;
      currController = controller6;
    }

    //Edit sixth textField
    else if (currController == controller6) {
      controller6.text = str;
      currController = controller6;
      setState(() {
        _isConfirmOtpEnabled = true;
      });
    }
  }

  void deleteText() {
    setState(() {
      _isConfirmOtpEnabled = false;
    });
    if (currController.text.length == 0) {
    } else {
      currController.text = "";
      currController = controller5;
      return;
    }

    if (currController == controller1) {
      controller1.text = "";
    } else if (currController == controller2) {
      controller1.text = "";
      currController = controller1;
    } else if (currController == controller3) {
      controller2.text = "";
      currController = controller2;
    } else if (currController == controller4) {
      controller3.text = "";
      currController = controller3;
    } else if (currController == controller5) {
      controller4.text = "";
      currController = controller4;
    } else if (currController == controller6) {
      controller5.text = "";
      currController = controller5;
    }
  }

  void goToPasswordScreen() {
    Map<String, String> mobileInfo = {"mobileNumber": dataFromPreviousPage["mobileNo"]};
    Navigator.pushNamed(context, UiPagesPath.LOGIN_USING_PASSWORD, arguments: mobileInfo);
    return;
  }

  void confirmOTP() {
    String otp = controller1.text.trim() +
        controller2.text.trim() +
        controller3.text.trim() +
        controller4.text.trim() +
        controller5.text.trim() +
        controller6.text.trim();
    String userId = dataFromPreviousPage['userId'];
    Map<String, String> requestPayload = {"otp": otp, "userId": userId};
    LoginRegisterController lg = new LoginRegisterController();
    lg.VerifyLoginOtp(requestPayload).then((value) {
      print(value);
      if (value['nextPage'].toString().isNotEmpty) {
        if(value['error'].toString().isEmpty){
          snackBar(true);
        }
        Navigator.pushNamedAndRemoveUntil(
            context, value['nextPage'], (route) => false);
      } else {
        snackBar(false);
        resetControllerVerifyOtp();
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  resetControllerVerifyOtp() {
    //load a snack bar and reload this widget
    controller1.text = "";
    controller2.text = "";
    controller3.text = "";
    controller4.text = "";
    controller5.text = "";
    controller6.text = "";
    currController = controller1;
    setState(() {
      _isConfirmOtpEnabled = false;
    });
  }

  snackBar(isOtpVerified) {
    if (isOtpVerified) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: Text('Otp Verified '),
        backgroundColor: Colors.green,
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Invalid otp"),
        backgroundColor: Colors.red,
      ));
    }
  }

  resetOtp() {
    print("inside resent otp");
    setState(() {
      _startTime = 120;
    });
    countDownTimer();
    LoginRegisterController lg = new LoginRegisterController();
    String userId = dataFromPreviousPage['userId'];
    Map<String, String> requestPayload = {"userId": userId};
    lg.ResendOtp(requestPayload).then((value) {
      print(value);
      if (value['nextPage'].isEmpty) {
        resetControllerVerifyOtp();
        showOtpSentSnackBar();
      } else {
        print("hello");
        Navigator.pushNamedAndRemoveUntil(
            context, value['nextPage'], (route) => false);
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  showOtpSentSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Otp sent"),
      backgroundColor: Colors.green,
    ));
  }
}
