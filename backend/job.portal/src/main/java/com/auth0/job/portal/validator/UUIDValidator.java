package com.auth0.job.portal.validator;

import static java.util.UUID.fromString;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UUIDValidator implements ConstraintValidator<UUID, String> {

  @Override
  public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {

    try {
      fromString(s);
      return true;
    }catch (IllegalArgumentException e){
      return  false;
    }

  }
}
