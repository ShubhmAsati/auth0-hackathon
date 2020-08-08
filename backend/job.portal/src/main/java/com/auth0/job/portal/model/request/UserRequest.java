package com.auth0.job.portal.model.request;

import static com.auth0.job.portal.constants.ApplicationConstants.ERR_MSG_INVALID_PHONE_NUMBER;
import static com.auth0.job.portal.constants.ApplicationConstants.PHONE_NUMBER_VALIDATION_REGEX;

import javax.validation.constraints.Pattern;
import lombok.Data;

@Data
public class UserRequest {

  @Pattern(message = ERR_MSG_INVALID_PHONE_NUMBER, regexp = PHONE_NUMBER_VALIDATION_REGEX)
  private String mobileNumber;

  private String email;

  private String firstName;

  private String lastName;

  private String city;

  private String state;

  private String country;

  @Pattern(message = "Should be a Integer", regexp = "[0-9]+")
  private String pinCode;

  private String addressLine1;

  private String landmark;


}
