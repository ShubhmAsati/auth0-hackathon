class Error {
  String errorCode;
  String errMsg;
  Map metadata;

  Error({this.errorCode, this.errMsg, this.metadata});

  String toString() {
    return 'ErrCode: $errorCode , ErrorMessage: $errMsg';
  }

  //various error codes
  static const unableToProcess = "Covid-Error-1";
  static const unableToProcessMsg =
      "Oops. We are unable to process your request. Please try again.";
  static const internalServerError = "Covid-Error-2";
  static const internalServerErrorMsg =
      "Something bad happened at our end . We are resolving the issue.";
  static const unexpectedError = "Covid-Unexpected-1";
  static const unexpectedErrorMsg =
      "We dont know what went bad. PLease contact us.";
}
