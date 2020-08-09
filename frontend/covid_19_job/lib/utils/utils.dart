import 'package:flutter/cupertino.dart';
import 'package:libphonenumber/libphonenumber.dart';

class Utils{
  static Future<bool> validPhoneNumber({String phoneNumber, String isoCode}) async{
    print(phoneNumber + " " + isoCode);
    bool isValid;
    try {
      isValid = await PhoneNumberUtil.isValidPhoneNumber(
          phoneNumber: phoneNumber, isoCode: isoCode);
    }
    catch(e){
      isValid =false;
    }
    return isValid;
  }

  static fieldFocusChange(BuildContext context,FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}