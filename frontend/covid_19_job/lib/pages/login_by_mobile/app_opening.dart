import 'package:covid_19_job/utils/jwt_token.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/get_local_data.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile_controller.dart';
import 'package:covid_19_job/const/ui_pages.dart';

class AppOpening extends StatefulWidget {
  @override
  _AppOpeningState createState() => _AppOpeningState();
}

class _AppOpeningState extends State<AppOpening> {
  @override
  void initState(){
    super.initState();
    doInitialCheckup();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Center(
        child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal)),
      ),
    ));
  }
  doInitialCheckup() async {
    //get hash stored locally
    String userHash = await GetLocalData.GetUserHash();
    print("user has is =" + userHash);
    if (userHash.isEmpty) {
      Navigator.pushNamedAndRemoveUntil(context, UiPagesPath.LOGIN_BY_MOBILE, (route) => false);
    } else {
      //do an authorize call
      LoginRegisterController lg = new LoginRegisterController();
      await lg.Authorize(userHash).then((value) {
        print("inside authorize call");
        Map<String, dynamic> nextPagePayload = value['data'];
        String nextPage = value['nextPage'];
        print(value['authorization']);
        nextPagePayload['authorization'] = value['authorization'];
        JWTTOKEN.token = value['authorization'];
        Navigator.pushNamedAndRemoveUntil(
            context, value['nextPage'], (route) => false,arguments: nextPagePayload);
      }).catchError((onError) {
        print("error happend");
        Navigator.pushNamedAndRemoveUntil(
            context, UiPagesPath.AWW_SNAP, (route) => false,
            arguments: onError);
        print("Ooops something terrible happend");
      });
    }
  }
}
