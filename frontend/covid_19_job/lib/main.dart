import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/pages/register_user/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid_19_job/pages/login_by_mobile/login_by_mobile.dart';
import 'package:covid_19_job/pages/errors/aww_snap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: LoginByMobile(),
    routes: {
      UiPagesPath.LOGIN_BY_MOBILE: (context) => LoginByMobile(),
      UiPagesPath.AWW_SNAP : (context) => AwwSnap(),
      UiPagesPath.REGISTER : (context) => Register()
    },
  ));
}
