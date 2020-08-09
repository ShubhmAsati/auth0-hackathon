import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _passwordVisible = false;
  TextEditingController _userPasswordController = new TextEditingController();
  bool _confirmPasswordVisible = false;
  TextEditingController otpController = TextEditingController();
  TextEditingController _confirmPasswordController =  new TextEditingController();
  Map<String,dynamic> dataFromPreviousPage;
  String mobileNumber = "m";
  Map<String,dynamic> nextPayload;
  String authorizedToken;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    dataFromPreviousPage = ModalRoute.of(context).settings.arguments;
    print(dataFromPreviousPage['nextPayload']);
    nextPayload = dataFromPreviousPage['nextPayload'];
    mobileNumber = nextPayload['mobileNumber'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      body: Builder(
        builder: (BuildContext innerContext){
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 20),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 30),
                  alignment: Alignment.center,
                  child: Text(mobileNumber,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Container(
                    padding:
                    const EdgeInsets.only(
                        left: 70, right: 70, top: 20, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: otpController,
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
                          labelText: 'Please enter otp',
                          hintText: 'Please enter otp'),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        verifyOtp(dataFromPreviousPage,innerContext);
                      },
                      child: Text(
                        "Verify Otp",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
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
                        labelText: 'New Password',
                        hintText: 'Enter your New password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          color: Colors.teal,
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    )),
                Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    child: TextFormField(
                      obscureText: !_confirmPasswordVisible,
                      keyboardType: TextInputType.text,
                      controller: _confirmPasswordController,
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
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your New password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          color: Colors.teal,
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible = !_confirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                    )),
                Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: RaisedButton(
                        onPressed: () {
                          resetPassword(innerContext);
                        },
                        color: Colors.teal[600],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text('Change Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Roboto',
                                letterSpacing: 4,
                              )),
                        )))
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  snackBar(bool isValidPassword,String msg, BuildContext context) {
    if (isValidPassword) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green,
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
      ));
    }
  }

  verifyOtp(Map<String,dynamic> data,BuildContext context) {
    LoginRegisterController lg = LoginRegisterController();
    Map<String, dynamic> otpDetails = {
      "otp" : otpController.text,
      "userId": nextPayload['data']['userId'],
    };
    lg.verifyOtp(otpDetails).then((value) {
      if (value["error"]
          .toString()
          .isEmpty) {
        if (UiPagesPath.AWW_SNAP == value['nextPage']) {
          Navigator.pushNamedAndRemoveUntil(
              context, UiPagesPath.AWW_SNAP, (route) => false);
        }
        else {
          authorizedToken = value['authorization'];
          snackBar(true, value['data']['message'], context);
        }
      }
      else {
        snackBar(false, value['error'],context);
      }
    }).catchError((onError) {
      print(onError);
      Navigator.pushNamedAndRemoveUntil(
          context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }

  resetPassword(BuildContext context){
    LoginRegisterController lg = LoginRegisterController();
    Map<String,dynamic> passwordDetails = {
      "password" : _userPasswordController.text
    };
    lg.resetPassword(passwordDetails, authorizedToken).then((value){
      if(value['error'].toString().isEmpty){
        if(UiPagesPath.AWW_SNAP == value['nextPage']){
          Navigator.pushNamedAndRemoveUntil(
              context, UiPagesPath.AWW_SNAP, (route) => false);
        }
        else{
          snackBar(true, value['data']['message'],context);
        }
      }
      else{
        snackBar(false, value["error"],context);
      }
    }).catchError((onError){
        Navigator.pushNamedAndRemoveUntil(
          context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }
}


