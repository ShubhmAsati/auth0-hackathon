import 'dart:convert';
import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:covid_19_job/rest_handler/rest_handler.dart';
import 'package:covid_19_job/utils/jwt_token.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:covid_19_job/const/api_pages.dart';
import 'package:covid_19_job/const/ui_pages.dart';
import 'dart:io';

class JobsController {
  JobsController();

  Future<Map<String, dynamic>> addJob(
      Map<String, dynamic> requestPayload) async {
    String apiPath =
        path.join(ApiPath.ADD_JOB);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'device-id': GetDeviceInfo.DeviceId,
      'authorization': 'Bearer ' + JWTTOKEN.token,
    };
    String body = jsonEncode(requestPayload);
    print(headers);
    print(body);
    ResponseHandler response =
        await RestHandler.syncPost(apiPath, null, headers, body);
    print(response.getHttpCode());
    print(response);
    if (response.getHttpCode() == 200) {
      return {
        "nextPage": UiPagesPath.MY_JOBS,
        "data": response.getResponse(),
        "error": ""
      };
    } else if (response.getHttpCode() == 400) {
      //some validation error
      return {
        "nextPage": '',
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else if (response.getHttpCode() == 404) {
      return {
        "nextPage": UiPagesPath.AWW_SNAP,
        "data": response.getResponse(),
        "error": response.getError(),
      };
    } else {
      throw (response);
    }
  }

  Future<Map<String, dynamic>> getJobTypes() async {
    String apiPath =
        path.join(ApiPath.IMAGES, ApiPath.APIVERSIONV1, ApiPath.JOB_TYPES);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'device-id': GetDeviceInfo.DeviceId,
      'authorization': JWTTOKEN.token,
    };
    print(headers);
    ResponseHandler response =
        await RestHandler.syncGet(apiPath, null, headers);
    print(response.getHttpCode());
    print(response.getResponse());
    if (response.getHttpCode() == 200) {
      return {"nextPage": '', "data": response.getResponse(), "error": ""};
    } else {
      throw response;
    }
  }

  Future<Set<String>> uploadImage(File image) async {
    String apiPath =
        path.join(ApiPath.IMAGES, ApiPath.APIVERSIONV1, ApiPath.UPLOAD_IMAGE);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'device-id': GetDeviceInfo.DeviceId,
      'authorization': JWTTOKEN.token,
    };
    print(headers);
    Set<String> response =
        await RestHandler.UploadImage(apiPath, headers, image);

    return response;
  }
}
