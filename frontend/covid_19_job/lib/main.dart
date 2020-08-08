import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/login_by_mobile/app_opening.dart';
import 'package:covid_19_job/pages/login_by_mobile/verify-otp.dart';
import 'package:covid_19_job/pages/register_user/register.dart';
import 'package:covid_19_job/pages/register_user/verify_otp.dart';
import 'package:covid_19_job/testing/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile.dart';
import 'package:covid_19_job/pages/errors/aww_snap.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initialSetup();
  runApp(MaterialApp(
    initialRoute: UiPagesPath.APP_OPENING,
    routes: {
      UiPagesPath.APP_OPENING : (context) =>AppOpening(),
      UiPagesPath.LOGIN_BY_MOBILE: (context) => LoginByMobile(),
      UiPagesPath.AWW_SNAP : (context) => AwwSnap(),
      UiPagesPath.REGISTER : (context) => Register(),
      UiPagesPath.VERIFY_REGISTER_OTP: (context) => VerifyOtp(),
      UiPagesPath.VERIFY_LOGIN_OTP: (context) => VerifyLoginOtp(),
      '/testing' : (context) => Testing(),
    },
  ));
}

initialSetup(){
  GetDeviceInfo.SetDevice();
  GetDeviceInfo.SetDeviceId();
}