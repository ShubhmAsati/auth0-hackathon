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

  Error getError() {
    return this.error;
  }

  Map<String, dynamic> getResponse() {
    return this.response;
  }

  String getErrorMessageShownToUser() {
    return error.metadata['error'];
  }
}
