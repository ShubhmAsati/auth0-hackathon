import 'dart:ui';

import 'package:covid_19_job/pages/register_user/registration_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentScope = FocusScope.of(context);
        if(!currentScope.hasPrimaryFocus){
          currentScope.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Builder(
            builder: (BuildContext innerContext) {
              return SingleChildScrollView(
                child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0,),
                          Text("SIGN UP",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500]
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 30, top: 50),
                            child: RegisterForm(
                              parentContext: context,
                              callback: (value,message) {
                                snackBar(value, innerContext,message);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            }
        ),
      ),
    );
  }

  snackBar(bool isRegistered,BuildContext context,String message){
    print(context);
    if(isRegistered){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(message),
          )
      );
    }
    else{
      Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(message),
          )
      );
    }
  }
}

