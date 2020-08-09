import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/jobs/jobs_controller.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';
import 'package:covid_19_job/utils/bottom_navigator.dart';
import 'package:covid_19_job/utils/jwt_token.dart';
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
  Map<String,dynamic> userData;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode stateFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode countryFocus = FocusNode();
  FocusNode pincodeFocus = FocusNode();
  FocusNode landmarkFocus = FocusNode();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getUserDetails(context);
  }

  setUserDetails(){
    if(userData.isNotEmpty) {
      firstNameController.text = userData['userDetails']['firstName'];
      lastNameController.text = userData['userDetails']['lastName'];
      emailController.text = userData['userDetails']['email'];
      countryController.text = userData['userDetails']['address']['country'];
      pincodeController.text = userData['userDetails']['address']['pinCode'];
      cityController.text = userData['userDetails']['address']['city'];
      stateController.text = userData['userDetails']['address']['state'];
      addressController.text = userData['userDetails']['address']['addressLine1'];
    }
  }

  @override
  Widget build(BuildContext context) {
    print(JWTTOKEN.token);
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
        body: Builder(
          builder: (BuildContext innerContext) {

            return SingleChildScrollView(
              child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: SizedBox(
                      height: size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              height: 250,
                              width: 150,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/app_logo.jpg'),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: TextFormField(
                                          focusNode: firstNameFocus,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, firstNameFocus,
                                                lastNameFocus);
                                          },
                                          controller: firstNameController,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                          )
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: TextFormField(
                                          controller: lastNameController,
                                          textInputAction: TextInputAction.next,
                                          focusNode: lastNameFocus,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, lastNameFocus,
                                                emailFocus);
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                width: size.width * .9,
                                child: TextFormField(
                                    controller: emailController,
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailFocus,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusChange(
                                          context, emailFocus, landmarkFocus);
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: TextFormField(
                                          controller: landmarkController,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, landmarkFocus, pincodeFocus);
                                          },
                                          focusNode: landmarkFocus,
                                          decoration: InputDecoration(
                                            focusColor: Colors.teal,
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                            labelText: 'Landmark',
                                            labelStyle: TextStyle(
                                                color: Colors.grey
                                            ),
                                            hintText: "Enter Landmark",
                                            hintStyle: TextStyle(
                                                color: Colors.grey
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                          )
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: TextFormField(
                                          controller: pincodeController,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.number,
                                          focusNode: pincodeFocus,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, pincodeFocus,
                                                cityFocus);
                                          },
                                          decoration: InputDecoration(
                                            focusColor: Colors.teal,
//                                      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                            labelText: 'Pincode',
                                            labelStyle: TextStyle(
                                                color: Colors.grey
                                            ),
                                            hintText: "Enter Pincode",
                                            hintStyle: TextStyle(
                                                color: Colors.grey
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: TextFormField(
                                          controller: cityController,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, cityFocus, stateFocus);
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                          )
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: TextFormField(
                                          controller: stateController,
                                          textInputAction: TextInputAction.next,
                                          focusNode: stateFocus,
                                          onFieldSubmitted: (value) {
                                            Utils.fieldFocusChange(
                                                context, stateFocus,
                                                countryFocus);
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.teal[500],
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0,
                                                  style: BorderStyle.solid
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(25.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                width: size.width * .9,
                                child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: countryController,
                                    focusNode: countryFocus,
                                    onFieldSubmitted: (value){
                                      Utils.fieldFocusChange(context, countryFocus, addressFocus);
                                    },
                                    decoration: InputDecoration(
                                      focusColor: Colors.teal,
//                                contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
                                      labelText: 'Country',
                                      labelStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      hintStyle: TextStyle(
                                          color: Colors.grey
                                      ),
                                      hintText: "Enter Country",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                    )
                                )
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                width: size.width * .9,
                                child: TextFormField(
                                    textInputAction: TextInputAction.done,
                                    controller: addressController,
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.teal[500],
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                            style: BorderStyle.solid
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                      ),
                                    )
                                )
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 5),
                            child: RaisedButton(
                              color: Colors.teal,
                              onPressed: () {
                                saveUserDetails(innerContext);
                              },
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
            );
          }
        ),
        bottomNavigationBar: BottomNavigator(),
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
  
  saveUserDetails(BuildContext innerContext){
    JobsController jg = JobsController();
    Map<String,dynamic> userDetails = {
      "addressLine1" : addressController.text,
      "email" : emailController.text,
      "firstName" : firstNameController.text,
      "lastName" : lastNameController.text,
      "city" : cityController.text,
      "state" : stateController.text,
      "country" : countryController.text,
      "pinCode" : pincodeController.text,
      "landmark" : landmarkController.text
    };
    jg.addUser(userDetails).then((value){
      print(value);
      if(value['nextPage'].isNotEmpty){
        Navigator.pushNamedAndRemoveUntil(innerContext, UiPagesPath.AWW_SNAP, (route) => false);
      }
      else{
        if(value['error'].isEmpty){
          snackBar(true, "User details updated successfully", innerContext);
        }
        else{
          snackBar(false, value['error'], innerContext);
        }
      }
    }).catchError((onError){
      print(onError);
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
    });
  }

  getUserDetails(BuildContext innerContext) {
    JobsController jg = JobsController();
    jg.getUserDetails().then((value){
      print(value);
      if(value['nextPage'].toString().isEmpty){
        Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
      }
      else {
        if (value['error']
            .toString()
            .isEmpty) {
          userData = value;
        }
        else {
          userData = null;
        }
      }
    }).catchError((onError){
      print(onError);
//      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.AWW_SNAP, (route) => false);
      userData =null;
    });
  }

  setUserType(BuildContext context,String userType){
    JobsController jg = JobsController();
    jg.setUserType(userType).then((value){
    }).catchError((onError){
      print(onError);
    });
  }
}
