import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:covid_19_job/models/rest_handler.dart';
import 'dart:convert';

class LoginRegisterController {
  LoginRegisterController();

  Future<Map<String, dynamic>> LoginByMobileNoOtp(mobileNo) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.LOGIN,
        ApiPath.APIVERSIONV1, ApiPath.LOGIN_BY_MOBILE_OTP, mobileNo);
    ResponseHandler response = await RestHandler.syncGet(apiPath, null, null);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200) {
      print(response.getResponse());
      return {
        "nextPage": UiPagesPath.VERIFY_LOGIN_OTP,
        "data": response.getResponse(),
        "error" : "",
      };
    } else if (response.getHttpCode() == 400 || response.getHttpCode() == 404 ) {
      //user is not registered go to register page
      return {"nextPage": UiPagesPath.REGISTER, "data": response.getResponse(),"error":response.getError()};
    } else if (response.getHttpCode() == 500) {
      //failed to generate otp , send to login with password screen
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }
  Future<Map<String, dynamic>> Authorize(String userHash) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.LOGIN,
        ApiPath.APIVERSIONV1,ApiPath.LOGIN_BY_SESSION_ID);
    Map<String,String> headers = {
      'session': userHash,
       'device-id' : GetDeviceInfo.DeviceId,
    };
    ResponseHandler response = await RestHandler.syncGet(apiPath, null, headers);
    if (response.getHttpCode() == 200) {
      print(response.getResponse());
      return {
        "nextPage": UiPagesPath.USER_HOME_PAGE,
        "data": response.getResponse(),
        "authorization": response.getHeader('authorization'),
      };
    } else if (response.getHttpCode() == 400) {
      //user is not registered go to register page
      return {"nextPage": UiPagesPath.AWW_SNAP, "data": response.getResponse()};
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

  Future<Map<String, dynamic>> VerifyLoginOtp(
      Map<String, String> requestPayload) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.LOGIN,
        ApiPath.APIVERSIONV1, ApiPath.VERIFY_LOGIN_OTP);
    String body = json.encode(requestPayload);
    print(body);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, String> queryParams = {
      "isLoginOTP": "true",
    };
    ResponseHandler response =
    await RestHandler.syncPost(apiPath, queryParams, headers, body);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200) {
      return {
        "nextPage": UiPagesPath.USER_HOME_PAGE,
        "data": response.getResponse(),
        "error": "",
      };
    } else if (response.getHttpCode() == 403 || response.getHttpCode() == 401) {
      //invalid otp or otp expired
      return {
        "nextPage": '',
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else if (response.getHttpCode() == 400) {
      //otp expired
      return {
        "nextPage": UiPagesPath.LOGIN_BY_MOBILE,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else if (response.getHttpCode() == 500) {
      //somthing bad happened on backend , we need to thought this through
      return {
        "nextPage": UiPagesPath.LOGIN_BY_MOBILE,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }

  Future<Map<String, dynamic>> ResendOtp(
      Map<String, String> requestPayload) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.LOGIN,
        ApiPath.APIVERSIONV1, ApiPath.RESEND_LOGIN_OTP);
    String body = json.encode(requestPayload);
    print(body);
    print(apiPath);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    ResponseHandler response =
    await RestHandler.syncPost(apiPath, null, headers, body);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200) {
      return {
        "nextPage": '',
        "data": response.getResponse(),
        "errorMsg": "",
      };
    } else if (response.getHttpCode() == 400) {
      //invalid request
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "errorMsg": response.getError(),
      };
    } else if (response.getHttpCode() == 403) {
      //otp expired
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "errorMsg": response.getError(),
      };
    } else if (response.getHttpCode() == 500) {
      //somthing bad happened on backend , we need to thought this through
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "errorMsg": response.getError(),
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }
}