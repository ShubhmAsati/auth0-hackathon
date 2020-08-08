import 'dart:ui';

import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/progess_loader/progress_loader.dart';
import 'package:covid_19_job/pages/register_user/register_controller.dart';
import 'package:covid_19_job/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterForm extends StatefulWidget {
  final BuildContext parentContext;
  final Function(bool,String) callback;
  RegisterForm({this.parentContext,this.callback});
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool pwdVisibility;
  bool mobileNoValid;
  PhoneNumber mobile;
  String isoCode;
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode mobileNoFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();
  FocusNode focusInfo = FocusNode();
  Color registerColor;
  bool formValid;
  Progress p;

  fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void registerColorChanger(){
    registerColor =  formValid?Colors.teal[500]:Colors.grey;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formValid = false;
    pwdVisibility = false;
    mobileNoValid = true;
    isoCode = "IN";
  }

  @override
  Widget build(BuildContext context) {
    registerColorChanger();
    p = Progress(widget.parentContext);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex:5,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: firstNameController,
                  focusNode: firstNameFocus,
                  onFieldSubmitted: (term){
                    Utils.fieldFocusChange(context, firstNameFocus, lastNameFocus);
                  },
                  validator: (value){
                    if(value.length>0){
                      return null;
                    }
                    else{
                      return "Invalid first name";
                    }
                  },
                  style: TextStyle(
                      color: Colors.black
                  ),
                  onChanged: (value) async{
                    bool mobileCheck;
                    try{
                      mobileCheck = await Utils.validPhoneNumber(phoneNumber:mobile.phoneNumber,isoCode:mobile.isoCode);
                    }
                    catch(e){
                      mobileCheck = false;
                    }
                    if(_formKey.currentState.validate() && mobileCheck){
                      setState(() {
                        formValid = true;
                        mobileNoValid = mobileCheck;
                      });
                    }
                    else{
                      setState(() {
                        formValid = false;
                        mobileNoValid = mobileCheck;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "Enter First Name",
                    labelStyle: TextStyle(
                        color:Colors.grey
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.black,
                    errorStyle: TextStyle(
                        color:Colors.red,
                        fontSize: 14
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color:Colors.red
                        )
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color:Colors.red
                        )
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width: 2.0,
                            style: BorderStyle.solid
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width: 2.0,
                            style: BorderStyle.solid
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width: 2.0,
                            style: BorderStyle.solid
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(width: 7,),
              Expanded(
                flex:5,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: lastNameController,
                  focusNode: lastNameFocus,
                  style: TextStyle(
                      color: Colors.black
                  ),
                  onFieldSubmitted: (term){
                    print(term);
                    Utils.fieldFocusChange(context, lastNameFocus, mobileNoFocus);
                  },
                  onChanged: (value) async{
                    bool mobileCheck;
                    try{
                      mobileCheck = await Utils.validPhoneNumber(phoneNumber:mobile.phoneNumber,isoCode:mobile.isoCode);
                    }
                    catch(e){
                      mobileCheck = false;
                    }
                    if(_formKey.currentState.validate() && mobileCheck){
                      setState(() {
                        formValid = true;
                        mobileNoValid = mobileCheck;
                      });
                    }
                    else{
                      setState(() {
                        formValid = false;
                        mobileNoValid = mobileCheck;
                      });
                    }
                  },
                  validator: (value){
                    if(value.length>0){
                      return null;
                    }
                    else{
                      return "Invalid last name";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    hintText: "Enter Last Name",
                    labelStyle: TextStyle(
                        color:Colors.grey
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    errorStyle: TextStyle(
                        color:Colors.red,
                        fontSize: 14
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color:Colors.red
                        )
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:BorderSide(
                            width: 2,
                            style: BorderStyle.solid,
                            color:Colors.red
                        )
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Colors.teal[500],
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal[500],
                            width:2.0
                        ),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.teal[500],
                          width:2.0
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(
                left: 10
            ),
            decoration: mobileNoValid?
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
              textFieldController: mobileController,
              focusNode: mobileNoFocus,
              keyboardAction: TextInputAction.next,
              onSubmit: (){
                Utils.fieldFocusChange(context, mobileNoFocus, pwdFocus);
              },
              countries: ['IN','US','GB'],
              errorMessage: null,
              onInputChanged: (PhoneNumber number) async{
                mobile = number;
                bool mobileCheck;
                mobileCheck = await Utils.validPhoneNumber(phoneNumber: number.phoneNumber, isoCode: number.isoCode);
                if(_formKey.currentState.validate() && mobileCheck){
                  setState(() {
                    formValid = true;
                  });
                }
                else{
                  setState(() {
                    formValid = false;
                  });
                }
              },
              onInputValidated: (bool value){
                print(value);
                setState(() {
                  mobileNoValid = value;
                });
              },
              inputDecoration: InputDecoration(
                hintText: "Enter Mobile No",
                border: OutlineInputBorder(
                    borderSide:BorderSide.none
                ),
              ),
            ),
          ),
          SizedBox(height: 8,),
          !mobileNoValid?Container(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Invalid Mobile No",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.red
              ),
            ),
          ):
          SizedBox(height: 0,),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            focusNode: pwdFocus,
            controller: passwordController,
            obscureText: !pwdVisibility,
            validator: (value){
//              RegExp regex = RegExp(r"^(?=.*?[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&~]).{8,}$");
              if(value.length>=8){
                return null;
              }
              return "Invalid password";
            },
            onChanged: (value) async{
              bool mobileCheck;
              try{
                mobileCheck = await Utils.validPhoneNumber(phoneNumber:mobile.phoneNumber,isoCode:mobile.isoCode);
              }
              catch(e){
                mobileCheck = false;
              }
              if(_formKey.currentState.validate() && mobileCheck){
                setState(() {
                  formValid = true;
                  mobileNoValid = mobileCheck;
                });
              }
              else{
                setState(() {
                  formValid = false;
                  mobileNoValid = mobileCheck;
                });
              }
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  pwdVisibility?Icons.visibility:
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: (){
                  setState(() {
                    pwdVisibility = pwdVisibility?false:true;
                  });
                },
              ),
              hintStyle: TextStyle(
                  color:Colors.grey
              ),
              labelStyle: TextStyle(
                  color:Colors.grey
              ),
              labelText: "Password",
              hintText: "Enter Password",
              errorStyle: TextStyle(
                  color:Colors.red,
                  fontSize: 14
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color:Colors.red
                  )
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color:Colors.red
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.teal[500]
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.teal[500]
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: Colors.teal[500]
                  )
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: (formValid && mobileNoValid)?Colors.teal[500]:Colors.grey,
                onPressed: (){
                  if(formValid && mobileNoValid){
                    goToVerifyOtpScreen();
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              OutlineButton(
                  textTheme: ButtonTextTheme.accent,
                  borderSide: BorderSide(
                      style: BorderStyle.none
                  ),
                  onPressed: () async{
                    Navigator.pushReplacementNamed(widget.parentContext, UiPagesPath.LOGIN_BY_MOBILE);
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal[500]
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          width:5
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.teal[500]
                        ),
                      ),

                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }

  snackBar(isRegistered){
    print(widget.parentContext);
    if(isRegistered){
      Scaffold.of(widget.parentContext).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("Registered Successfully"),
          )
      );
    }
    else{
      Scaffold.of(widget.parentContext).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Invalid user details"),
          )
      );
    }
  }

  goToVerifyOtpScreen() async{
    RegisterController rg = RegisterController();
    Map<String,dynamic> userDetails ={
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobileNo": mobile.phoneNumber,
      "password": passwordController.text
    };
//    p.pr.show();
    rg.registerUser(userDetails).then((value){
      String nextPage = value['nextPage'];
      if (nextPage.isEmpty){
        widget.callback(false,value['error']);
      }else{
        widget.callback(true,"Success");
        Map<String,dynamic> nextPagePayload = value;
        nextPagePayload["mobileNo"] = mobile.phoneNumber;
        nextPagePayload["previousPage"] = "/register";
        Navigator.pushNamed(widget.parentContext,value["nextPage"],arguments: {
          "nextPagePayload" : nextPagePayload
        });
      }
    }
    ).catchError((err){
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }
}

