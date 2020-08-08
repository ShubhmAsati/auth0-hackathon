import 'dart:convert';

import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:path/path.dart' as path;

class RegisterController{
  RegisterController();

  Future<Map<String,dynamic>> registerUser(Map<String,dynamic> userDetails) async{
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.REGISTER,ApiPath.APIVERSIONV1,ApiPath.STEP_ONE);
    Map<String,String> headers = {
      'Content-Type' : 'application/json; charset=UTF-8'
    };
    String body = json.encode(userDetails);
    print(body);
    ResponseHandler response = await RestHandler.syncPost(apiPath, null, headers, body);
    if(response.getHttpCode() == 201 || response.getHttpCode()==200){
      //success path

      return {
        "nextPage" : UiPagesPath.VERIFY_REGISTER_OTP,
        "data" : response.getResponse(),
        "error" : ""
      };
    }else if (response.getHttpCode() == 400){
      // any validation error
      return {
        "nextPage" : "",
        "data" : response.getResponse(),
        "error" : response.getError()
      };
    }
    else if(response.getHttpCode() == 409){
     //user already registered
      print(response.error.toString());
      return {
        "nextPage" : UiPagesPath.USER_HOME_PAGE,
        "data" : response.getResponse(),
        "error" : response.getError(),
      };
    }
    else if(response.getHttpCode() == 403){
      return {
        "nextPage" : UiPagesPath.AWW_SNAP,
        "data" : response.getResponse(),
        "error" : "Un authorized call"
      };
    }
    else{
      throw (response);
    }
  }

  Future<Map<String, dynamic>> VerifyRegisterOtp(
      Map<String, String> requestPayload) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.REGISTER,
        ApiPath.APIVERSIONV1, ApiPath.VERIFY_REGISTER_OTP);
    String body = json.encode(requestPayload);
    print(body);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'device-id' : GetDeviceInfo.DeviceId,
    };
    ResponseHandler response =
    await RestHandler.syncPost(apiPath, null, headers, body);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200) {
      return {
        "nextPage": UiPagesPath.USER_HOME_PAGE,
        "data": response.getResponse(),
        "error": "",
      };
    } else if (response.getHttpCode() == 401) {
      //invalid otp
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
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }

  Future<Map<String, dynamic>> ResendOtp(
      String userId) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL, ApiPath.REGISTER,
        ApiPath.APIVERSIONV1, ApiPath.RESEND_REGISTER_OTP,userId);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String,String> queryParams = {
      'newRequired': 'true',
    };
    ResponseHandler response =
    await RestHandler.syncGet(apiPath, queryParams, headers);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200) {
      return {
        "nextPage": UiPagesPath.USER_HOME_PAGE,
        "data": response.getResponse(),
        "error": "",
      };
    } else if (response.getHttpCode() == 400) {
      //invalid user
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else if (response.getHttpCode() == 403) {
      //otp expired
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": "Aww Snap",
      };
    } else if (response.getHttpCode() == 500) {
      //somthing bad happened on backend , we need to thought this through
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": "Aww Snap",
      };
    } else {
      throw (response);
      //oops something bad happened we are trying to resolve the issue
    }
  }
}