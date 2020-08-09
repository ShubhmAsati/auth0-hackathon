import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';
import 'package:covid_19_job/utils/get_local_data.dart';
import 'package:covid_19_job/utils/jwt_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginUsingPassword extends StatefulWidget {
  @override
  _LoginUsingPasswordState createState() => _LoginUsingPasswordState();
}

class _LoginUsingPasswordState extends State<LoginUsingPassword> {
  Map<String,dynamic> dataFromPreviousPage;
  bool _passwordVisible = false;
  TextEditingController _userPasswordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dataFromPreviousPage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Enter Password',
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.teal[400],
      ),
      body: Builder(
        builder: (BuildContext innerContext){
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      decoration: InputDecoration(
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
                        labelText: 'Password',
                        hintText: 'Enter you password',
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
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      onPressed: () {
                        goToJobSearchScreen(innerContext);
                      },
                      color: Colors.teal[600],
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              letterSpacing: 4,
                            )),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: new FlatButton(
                          onPressed: () {
                            goToForgotPasswordScreen(innerContext);
                          },
                          child: Text(
                            'Forgot Password ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              letterSpacing: 4,
                              color: Colors.teal[300],
                            ),
                          )))
                ],

              ));
        }
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

  void goToForgotPasswordScreen(BuildContext innerContext){
    LoginRegisterController lg = LoginRegisterController();
    lg.forgotPassword(dataFromPreviousPage['mobileNumber']).then((value){
      Map<String,dynamic> nextPagePayload = value;
      if(value['error'].toString().isEmpty) {
        if (value['nextPage'] == UiPagesPath.LOGIN_BY_MOBILE) {
          Navigator.pushNamedAndRemoveUntil(
              context, UiPagesPath.LOGIN_BY_MOBILE, (route) => false);
        }
        else if (value['nextPage'] == UiPagesPath.FORGOT_PASSWORD) {
          nextPagePayload['mobileNumber'] = dataFromPreviousPage['mobileNumber'];
          Navigator.pushNamed(context, UiPagesPath.FORGOT_PASSWORD, arguments: {
            "nextPayload": nextPagePayload
          });
        }
      }
      else{
        snackBar(false, value['error'],context);
      }
    }).catchError((onError){
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }

  void goToJobSearchScreen(BuildContext innerContext){
    Map<String,dynamic> passwordDetails = {
      "mobileNumber" : dataFromPreviousPage["mobileNumber"],
      "password" : _userPasswordController.text
    };
    LoginRegisterController lg = LoginRegisterController();
    lg.loginUsingPassword(passwordDetails).then((value){
      Map<String,dynamic> response = value;
      if(value["error"].toString().isEmpty){
        JWTTOKEN.token = value['authorization'];
        GetLocalData.AddHash(value['session']);
        Navigator.pushNamedAndRemoveUntil(context, value["nextPage"], (route) => false);
      }
      else{
        snackBar(false,value["error"],context);
      }
    }).catchError((onError){
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route)=>false);
    });
  }
}
