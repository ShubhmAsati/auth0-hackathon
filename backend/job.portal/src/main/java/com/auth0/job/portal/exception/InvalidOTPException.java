package com.auth0.job.portal.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class InvalidOTPException extends RuntimeException {

  public InvalidOTPException(String message){
    super(message);
  }

}
