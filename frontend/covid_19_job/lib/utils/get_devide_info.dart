import 'dart:io' show Platform;
import 'package:covid_19_job/global/global.dart' as globals;
import 'package:device_info/device_info.dart';

class GetDeviceInfo {
  static String ANDROID = "android";
  static String IOS = 'ios';
  static String deviceType = "";
  static String DeviceId = "";
  static SetDevice() {
    if (Platform.isAndroid) {
      deviceType = ANDROID;
    } else if (Platform.isIOS) {
      deviceType = IOS;
    } else {
      deviceType = "ERROR";
    }
  }
  static SetDeviceId()async {
    if(deviceType == ANDROID){
      AndroidDeviceInfo androidDeviceInfo = await globals.DeviceInfo.androidInfo;
      DeviceId = androidDeviceInfo.brand + androidDeviceInfo.model;
    }else if (deviceType == IOS){
       IosDeviceInfo iosDeviceInfo = await globals.DeviceInfo.iosInfo;
      DeviceId = 'apple' + iosDeviceInfo.model;
    }
  }
}
