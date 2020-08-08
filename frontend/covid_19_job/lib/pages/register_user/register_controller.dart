import 'dart:convert';

import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/const/ui_pages.dart';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:path/path.dart' as path;

class RegisterController{
  RegisterController();

  Future<Map<String,dynamic>> registerUser(Map<String,dynamic> userDetails) async{
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.REGISTER,ApiPath.APIVERSIONV1,ApiPath.STEP_ONE);
    Map<String,String> headers = {
      'Content-Type' : 'application/json; charset=UTF-8'
    };
    String body = json.encode(userDetails);
    ResponseHandler response = await RestHandler.syncPost(apiPath, null, headers, body);
    print(response.getHttpCode());
    if(response.getHttpCode() == 201){
      //success path
      return {
        "nextPage" : UiPagesPath.VERIFY_LOGIN_OTP,
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
      return {
        "nextPage" : UiPagesPath.USER_HOME_PAGE,
        "data" : response.getResponse(),
        "error" : ""
      };
    }
    else if(response.getHttpCode() == 403){
      return {
        "nextPage" : UiPagesPath.AWW_SNAP,
        "data" : response.getResponse(),
        "error" : "Invalid User Details"
      };
    }
    else{
      throw (response);
    }
  }
}