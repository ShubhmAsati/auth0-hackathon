package com.auth0.job.portal.validator;

import static com.auth0.job.portal.constants.ApplicationConstants.ERR_MSG_INVALID_UUID;
import static com.auth0.job.portal.constants.ApplicationConstants.PHONE_NUMBER_VALIDATION_REGEX;
import static java.util.UUID.fromString;

import com.auth0.job.portal.enums.UserType;
import com.auth0.job.portal.exception.ValidationsException;
import java.util.UUID;
import org.springframework.stereotype.Component;

@Component
public class RequestValidator {

  public UUID validateAndReturnUserId(String userId) {
    try {
      return fromString(userId);
    } catch (IllegalArgumentException e) {
      throw new ValidationsException(ERR_MSG_INVALID_UUID);
    }
  }

  public void validateMobileNumber(String phoneNumber) {
    if (!phoneNumber.matches(PHONE_NUMBER_VALIDATION_REGEX)) {
      throw new ValidationsException(ERR_MSG_INVALID_UUID);
    }
  }

  public UserType validateUserType(String userType) {
    try {
      return UserType.valueOf(userType);
    } catch (IllegalArgumentException e) {
      throw new ValidationsException("Invalid user type.");
    }
  }
}
