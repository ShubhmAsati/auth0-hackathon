package com.auth0.job.portal.constants;

public class ApplicationConstants {

  private ApplicationConstants() {
  }

  public static final String CONTEXT_URL = "/jobPortal";
  public static final String PHONE_NUMBER_VALIDATION_REGEX = "[+](([9][1])|([4]{2})|([1]))[0-9]{10}";
  public static final String OTP_MESSAGE = "Your Job portal verification code is: %s \n Do not share with anyone.";
  public static final String ERR_MSG_EXPIRED_OTP = "Your otp has been expired.";
  public static final String ERR_MSG_EXCEED_OTP_RESEND_COUNTS = "Your have exceed the otp resend counts.";
  public static final String ERR_MSG_INVALID_OTP = "Invalid otp, please try again.";
  public static final String ERR_MSG_INVALID_UUID = "Should be a valid UUID.";
  public static final String ERR_MSG_INVALID_PHONE_NUMBER = "mobileNumber should be a valid number of 10 digits with +91 or +44 or +1";
  public static final String ERR_MSG_INVALID_PASSWORD = "Invalid password, please try again";
  public static final String OTP_SUCCESS_MESSAGE = "OTP sent successfully";
  public static final String VERIFIED_OTP_MESSAGE = "OTP verified successfully";
  public static final String RESET_PASSWORD_MESSAGE = "Your password has been reset successfully!";
  public static final String REGISTRATION_SUCCESS_MESSAGE = "User registered successfully!";
  public static final String SESSION = "Session";
  public static final String TEMP_DIR = "java.io.tmpdir";

  //Jobs
  //Jobs Related
  public static final String JOBS_URL=CONTEXT_URL+"/jobs/v1";
  public static final int JOBS_PER_PAGE=10;

  //Search Related
  public static final String SEARCH="/search";
  public static final Integer DEFAULT_RADIUS=50;
  public static final Integer DEFAULT_JOB_PAGE=0;
  public static final String INSUFFICIENT_SEARCH_PARAMETERS="Enter coordinates or area or city";



  //Job Error
  public static final String ERR_MSG_INVALID_JOB_ID= "Invalid Job ID, please try again";
  public static final String ERR_MSG_INVALID_JOB_REVIEWS_CREATION="Job Reviews not created";



}
