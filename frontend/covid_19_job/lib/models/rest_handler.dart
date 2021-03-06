import 'package:covid_19_job/models/error.dart';

class ResponseHandler {
  Map<String, dynamic> response;
  Map<String, String> headers;
  int httpStatus;
  Error error;

  ResponseHandler({this.response, this.headers, this.httpStatus, this.error});

  int getHttpCode() {
    return this.httpStatus;
  }

  String getError() {
    return this.error.metadata['errorMessage'].toString();
  }

  Map<String, dynamic> getResponse() {
    return this.response;
  }

  String getErrorMessageShownToUser() {
    return error.metadata['error'];
  }

  String getHeader(key) {
    try {
      String val = headers[key];
      print(val);
      return val;
    } catch (e) {
      return '';
    }
  }
}
