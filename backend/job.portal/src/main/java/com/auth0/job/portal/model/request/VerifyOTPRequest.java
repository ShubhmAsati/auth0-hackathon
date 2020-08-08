package com.auth0.job.portal.model.request;

import com.auth0.job.portal.validator.UUID;
import com.auth0.job.portal.validator.UnsignedInteger;
import lombok.Data;

@Data
public class VerifyOTPRequest {

  @UUID
  private String userId;

  @UnsignedInteger
  private String otp;

}
