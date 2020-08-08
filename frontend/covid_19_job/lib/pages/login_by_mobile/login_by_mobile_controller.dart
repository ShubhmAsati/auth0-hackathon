import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/const/api_pages.dart';
import 'package:path/path.dart' as path;
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:covid_19_job/models/rest_handler.dart';


class LoginRegisterController {
  LoginRegisterController();

  Future<Map<String, dynamic>> LoginByMobileNoOtp(mobileNo) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.LOGIN,
        ApiPath.APIVERSIONV1, ApiPath.LOGIN_BY_MOBILE_OTP, mobileNo);
    ResponseHandler response = await RestHandler.syncGet(apiPath, null, null);
    if (response.getHttpCode() == 200) {
      print(response.getResponse());
      return {
        "nextPage": UiPagesPath.VERIFY_LOGIN_OTP,
        "data": response.getResponse()
      };
    } else if (response.getHttpCode() == 400) {
      //user is not registered go to register page
      return {"nextPage": UiPagesPath.REGISTER, "data": response.getResponse()};
    } else if (response.getHttpCode() == 500) {
      //failed to generate otp , send to login with password screen
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse()
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }



}