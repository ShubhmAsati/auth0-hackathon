package com.auth0.job.portal.converter;

import com.auth0.job.portal.model.OTPDto;
import com.auth0.job.portal.model.request.VerifyOTPRequest;
import java.util.UUID;

public class OTPRequestConverter {

  private OTPRequestConverter() {
  }

  public static OTPDto toDto(VerifyOTPRequest verifyOTPRequest) {
    return OTPDto.builder()
        .userId(UUID.fromString(verifyOTPRequest.getUserId()))
        .otp(Integer.valueOf(verifyOTPRequest.getOtp()))
        .build();
  }

}
