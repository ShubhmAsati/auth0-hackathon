import 'dart:convert';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/const/ui_pages.dart';

class JobsController{
  JobsController();


  Future<Map<String,dynamic>> addJob(Map<String,dynamic> requestPayload) async{
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.JOB,ApiPath.APIVERSIONV1);
    Map<String,String> headers = {
      'Content-Type' : 'application/json; charset=UTF-8',
      'device-id' : GetDeviceInfo.DeviceId,
    };
    print(requestPayload);
    ResponseHandler response = await RestHandler.syncPost(apiPath, null, headers, requestPayload);
    print(response.getHttpCode());
    if (response.getHttpCode() == 200){
      return {
        "nextPage" : UiPagesPath.MY_JOBS,
        "data" : response.getResponse(),
        "error" : ""
      };
    }else if (response.getHttpCode() == 400){
      //some validation error
      return {
        "nextPage" : '',
        "data": response.getResponse(),
        "error" : response.getError(),
      };
    }else if(response.getHttpCode() == 404){
      return {
        "nextPage" : UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error" : response.getError(),
      };
    }else{
     throw(response);
    }
  }
}