package com.auth0.job.portal.converter;

import com.auth0.job.portal.entity.OtpManagerEntity;
import com.auth0.job.portal.model.OtpDetailsDto;

public class OtpDetailsConverter {

  private OtpDetailsConverter() {
  }

  public static OtpDetailsDto toOtpDetailsDto(OtpManagerEntity otpManagerEntity) {
    return OtpDetailsDto.builder()
        .otpId(otpManagerEntity.getId())
        .lastUpdatedAt(otpManagerEntity.getUpdatedAt())
        .otp(otpManagerEntity.getOtp())
        .userId(otpManagerEntity.getUserId())
        .resendCount(otpManagerEntity.getResendCount())
        .isLoginOTP(otpManagerEntity.getIsLoginOTP())
        .otpType(otpManagerEntity.getOtpType())
        .build();
  }

  public static OtpManagerEntity toEntity(OtpDetailsDto otpDetailsDto) {
    return OtpManagerEntity.builder()
        .resendCount(otpDetailsDto.getResendCount())
        .userId(otpDetailsDto.getUserId())
        .otp(otpDetailsDto.getOtp())
        .id(otpDetailsDto.getOtpId())
        .isLoginOTP(otpDetailsDto.getIsLoginOTP())
        .otpType(otpDetailsDto.getOtpType())
        .build();
  }

}
