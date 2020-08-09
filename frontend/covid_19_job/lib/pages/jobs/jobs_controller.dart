import 'dart:convert';
import 'dart:io';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:covid_19_job/utils/jwt_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/const/ui_pages.dart';

class JobsController{
  JobsController();

  Future<Map<String,dynamic>> addUser(Map<String,dynamic> userDetails) async{
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.USER,ApiPath.APIVERSIONV1);
    Map<String,String> headers = {
      HttpHeaders.authorizationHeader: "Bearer ${JWTTOKEN.token}",
      "deviceId" : GetDeviceInfo.DeviceId,
      "Content-Type" : "application/json; charset=UTF-8"
    };
    String body = json.encode(userDetails);
    ResponseHandler response = await RestHandler.syncPut(apiPath, null, headers, body);
    if(response.getHttpCode() == 200){
      return {
        "nextPage":"",
        "data":response.getResponse(),
        "error" : ""
      };
    }
    else if(response.getHttpCode() == 400){
      return {
        "nextPage":"",
        "data":response.getResponse(),
        "error":response.getError()
      };
    }
    else if(response.getHttpCode() == 404){
      return {
        "nextPage":UiPagesPath.AWW_SNAP,
        "data" : response.getResponse(),
        "error" :""
      };
    }
    else{
      throw(response);
    }
  }

  Future<Map<String,dynamic>> getUserDetails() async{
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.USER,ApiPath.APIVERSIONV1);
    Map<String,String> headers = {
      HttpHeaders.authorizationHeader: "Bearer ${JWTTOKEN.token}",
      "deviceId" : GetDeviceInfo.DeviceId,
    };
    ResponseHandler response = await RestHandler.syncGet(apiPath, null, headers);
    if(response.getHttpCode() == 200){
      return {
        "nextPage" : "",
        "data" : response.getResponse(),
        "error" : ""
      };
    }
    else if(response.getHttpCode() == 400){
      return {
        "nextPage" : "",
        "data" : response.getResponse(),
        "error" : response.getError()
      };
    }
    else if(response.getHttpCode() == 404){
      return {
        "nextPage" : UiPagesPath.AWW_SNAP,
        "data" : response.getResponse(),
        "error" : ""
      };
    }
    else{
      throw(response);
    }
  }

  Future<Map<String,dynamic>> setUserType(String userType) async {
    String apiPath = path.join(ApiPath.JOB_PORTAL,ApiPath.USER,ApiPath.APIVERSIONV1,userType);
    Map<String,String> headers = {
      HttpHeaders.authorizationHeader : "Bearer ${JWTTOKEN.token}"
    };
    ResponseHandler response = await RestHandler.syncGet(apiPath, null, headers);
    if(response.getHttpCode() == 200){
      return {
        "nextPage":"",
        "data":response.getResponse(),
        "error" : ""
      };
    }
    else if(response.getHttpCode() == 400){
      return {
        "nextPage":"",
        "data":response.getResponse(),
        "error":response.getError()
      };
    }
    else if(response.getHttpCode() == 404){
      return {
        "nextPage":UiPagesPath.AWW_SNAP,
        "data":response.getResponse(),
        "error":""
      };
    }
    else{
      throw(response);
    }
  }
}