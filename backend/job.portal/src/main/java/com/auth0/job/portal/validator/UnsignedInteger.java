package com.auth0.job.portal.validator;


import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = UnsignedIntegerValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface UnsignedInteger {

  String message() default "otp should be a valid Integer of 6 digit";

  Class<?>[] groups() default {};

  Class<? extends Payload>[] payload() default {};

}
