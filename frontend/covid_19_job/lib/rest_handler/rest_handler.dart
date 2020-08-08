import 'dart:convert';

import 'package:covid_19_job/models/rest_handler.dart';
import 'package:covid_19_job/models/error.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

const int httpStatusOk = 200;
const int httpStatusBadRequest = 400;
const int httpUnknownRequest = 503;
const String hostPath = '34.71.141.11:80';
const JOB_PORTAL = "jobPortal";
const LOGIN = "login";
const APIVERSIONV1 = "v1";

class RestHandler {
  static Future<ResponseHandler> syncGet(
      String apiPath, Map<String, String> queryParams, Map headers) async {
    try {
      // var uri =
      //    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
      var url = Uri.http(hostPath, apiPath, queryParams);
      print(url);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> result;
        if (response.body.isNotEmpty) {
          result = jsonDecode(response.body);
        }
        ResponseHandler resp = ResponseHandler(
            response: result,
            headers: response.headers,
            httpStatus: httpStatusOk,
            error: null);
        return resp;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.unableToProcess,
            errMsg: Error.unableToProcessMsg,
            metadata: error);
        print(error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.internalServerError,
            errMsg: Error.internalServerErrorMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else {
        Error err = Error(
            errorCode: Error.unexpectedError,
            errMsg: Error.unexpectedErrorMsg,
            metadata: {
              "message": "Something terrible happened . PLease try in some time"
            });
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      }
    } catch (ex) {
      print(ex);
      Error err = Error(
          errorCode: Error.unexpectedError,
          errMsg: Error.unexpectedErrorMsg,
          metadata: {
            "message": "Something terrible happened . PLease try in some time"
          });
      ResponseHandler resp = ResponseHandler(
          response: null, httpStatus: httpUnknownRequest, error: err);
      throw (resp);
    }
  }

  static Future<ResponseHandler> syncPost(
      String apiPath,
      Map<String, String> queryParams,
      Map<String, String> headers,
      body) async {
    try {
      // var uri =
      //    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
      var url = Uri.http(hostPath, apiPath, queryParams);
      print(url);
      http.Response response =
          await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map result;
        if (response.body.isNotEmpty) {
          result = jsonDecode(response.body);
        }
        ResponseHandler resp = ResponseHandler(
            response: result,
            headers: response.headers,
            httpStatus: httpStatusOk,
            error: null);
        return resp;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Map error = jsonDecode(response.body);
        print(error);
        Error err = Error(
            errorCode: Error.unableToProcess,
            errMsg: Error.unableToProcessMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        Map error = jsonDecode(response.body);
        print(error);
        Error err = Error(
            errorCode: Error.internalServerError,
            errMsg: Error.internalServerErrorMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else {
        Error err = Error(
            errorCode: Error.unexpectedError,
            errMsg: Error.unexpectedErrorMsg,
            metadata: {
              "message": "Something terrible happened . PLease try in some time"
            });
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      }
    } catch (ex) {
      print(ex);
      Error err = Error(
          errorCode: Error.unexpectedError,
          errMsg: Error.unexpectedErrorMsg,
          metadata: {
            "message": "Something terrible happened . PLease try in some time"
          });
      ResponseHandler resp = ResponseHandler(
          response: null, httpStatus: httpUnknownRequest, error: err);
      return resp;
    }
  }

  static Future<ResponseHandler> syncPut(String apiPath,
      Map<String, String> queryParams, Map headers, String body) async {
    try {
      // var uri =
      //    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
      var url = Uri.https(hostPath, apiPath, queryParams);

      http.Response response =
          await http.put(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        Map result = jsonDecode(response.body);
        ResponseHandler resp = ResponseHandler(
            response: result,
            headers: response.headers,
            httpStatus: httpStatusOk,
            error: null);
        return resp;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.unableToProcess,
            errMsg: Error.unableToProcessMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.internalServerError,
            errMsg: Error.internalServerErrorMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else {
        Error err = Error(
            errorCode: Error.unexpectedError,
            errMsg: Error.unexpectedErrorMsg,
            metadata: {
              "message": "Something terrible happened . PLease try in some time"
            });
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      }
    } catch (ex) {
      Error err = Error(
          errorCode: Error.unexpectedError,
          errMsg: Error.unexpectedErrorMsg,
          metadata: {
            "message": "Something terrible happened . PLease try in some time"
          });
      ResponseHandler resp = ResponseHandler(
          response: null, httpStatus: httpUnknownRequest, error: err);
      return resp;
    }
  }

  static Future<ResponseHandler> syncDelete(
      String apiPath, Map<String, String> queryParams, Map headers) async {
    try {
      // var uri =
      //    Uri.https('www.myurl.com', '/api/v1/test/${widget.pk}', queryParameters);
      var url = Uri.https(hostPath, apiPath, queryParams);

      http.Response response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        Map result = jsonDecode(response.body);
        ResponseHandler resp = ResponseHandler(
            response: result,
            headers: response.headers,
            httpStatus: httpStatusOk,
            error: null);
        return resp;
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.unableToProcess,
            errMsg: Error.unableToProcessMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        Map error = jsonDecode(response.body);
        Error err = Error(
            errorCode: Error.internalServerError,
            errMsg: Error.internalServerErrorMsg,
            metadata: error);
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      } else {
        Error err = Error(
            errorCode: Error.unexpectedError,
            errMsg: Error.unexpectedErrorMsg,
            metadata: {
              "message": "Something terrible happened . PLease try in some time"
            });
        ResponseHandler resp = ResponseHandler(
            response: null, httpStatus: response.statusCode, error: err);
        return resp;
      }
    } catch (ex) {
      Error err = Error(
          errorCode: Error.unexpectedError,
          errMsg: Error.unexpectedErrorMsg,
          metadata: {
            "message": "Something terrible happened . PLease try in some time"
          });
      ResponseHandler resp = ResponseHandler(
          response: null, httpStatus: httpUnknownRequest, error: err);
      return resp;
    }
  }
}
