package com.auth0.job.portal.service;

import static com.auth0.job.portal.constants.ApplicationConstants.ERR_MSG_EXCEED_OTP_RESEND_COUNTS;
import static com.auth0.job.portal.constants.ApplicationConstants.ERR_MSG_EXPIRED_OTP;
import static com.auth0.job.portal.constants.ApplicationConstants.ERR_MSG_INVALID_OTP;
import static com.auth0.job.portal.constants.ApplicationConstants.OTP_MESSAGE;
import static java.lang.String.format;

import com.auth0.job.portal.config.PropertyConfig;
import com.auth0.job.portal.enums.OtpType;
import com.auth0.job.portal.exception.InvalidOTPException;
import com.auth0.job.portal.exception.NotFoundException;
import com.auth0.job.portal.model.OTPDto;
import com.auth0.job.portal.model.OtpDetailsDto;
import com.auth0.job.portal.repository.OtpManagerRepository;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class OTPService {

  private final PropertyConfig propertyConfig;
  private final OtpManagerRepository otpManagerRepository;

  public OtpDetailsDto generateAndSendOTP(UUID userId, String phoneNumber, OtpType otpType) {
    OtpDetailsDto otpDetailsDto;
    try {
      otpDetailsDto = otpManagerRepository.getOtpDetails(userId, otpType);
    } catch (NotFoundException e) {
      return otpManagerRepository.saveOtp(buildOtpDetailsDto(userId, phoneNumber, otpType));
    }
    otpDetailsDto.setOtp(sendOTP(phoneNumber, generateOtp()));
    otpDetailsDto.setResendCount(0);
    return otpManagerRepository.saveOtp(otpDetailsDto);

  }

  private OtpDetailsDto buildOtpDetailsDto(UUID userId, String phoneNumber, OtpType otpType) {
    return OtpDetailsDto.builder()
        .userId(userId)
        .otp(sendOTP(phoneNumber, generateOtp()))
        .resendCount(0)
        .otpType(otpType)
        .build();
  }

  private Integer sendOTP(String phoneNumber, Integer otp) {
    log.info(format(OTP_MESSAGE, otp));
//    Message.creator(new PhoneNumber(phoneNumber), // to
//        new PhoneNumber(propertyConfig.getTwilioAccountPhoneNumber()), // from
//        format(OTP_MESSAGE, otp)).create();
    return otp;
  }

  private Integer generateOtp() {
    return ThreadLocalRandom.current().nextInt(100000, 999999);
  }

  public OtpDetailsDto validateOtp(OTPDto otpDto, OtpType otpType) {
    OtpDetailsDto otpDetailsDto = otpManagerRepository.getOtpDetails(otpDto.getUserId(), otpType);
    validateExpiry(otpDetailsDto.getLastUpdatedAt());
    if (!otpDetailsDto.getOtp().equals(otpDto.getOtp())) {
      throw new InvalidOTPException(ERR_MSG_INVALID_OTP);
    }
    otpManagerRepository.deleteByUserId(otpDetailsDto.getOtpId());
    return otpDetailsDto;
  }

  private void validateExpiry(LocalDateTime dateTime) {
    long seconds = ChronoUnit.SECONDS.between(dateTime, LocalDateTime.now());
    if (propertyConfig.getOtpExpirationTimeInMinutes().longValue() * 60 < seconds) {
      throw new InvalidOTPException(ERR_MSG_EXPIRED_OTP);
    }
  }

  public void resendOTP(UUID userId, String mobileNumber, Boolean isNewRequired, OtpType otpType) {
    OtpDetailsDto otpDetailsDto = otpManagerRepository.getOtpDetails(userId, otpType);
    if (isNewRequired) {
      generateAndSendOTP(userId, mobileNumber, otpType);
    } else {
      validateResendCounts(otpDetailsDto.getResendCount());
      otpDetailsDto.setResendCount(otpDetailsDto.getResendCount() + 1);
      otpManagerRepository.saveOtp(otpDetailsDto);
      sendOTP(mobileNumber, otpDetailsDto.getOtp());
    }
  }

  private void validateResendCounts(Integer resendCount) {
    if (propertyConfig.getOtpResendCount().equals(resendCount)) {
      throw new InvalidOTPException(ERR_MSG_EXCEED_OTP_RESEND_COUNTS);
    }
  }

  public void updateOtpType(OtpDetailsDto otpDetailsDto) {
    otpManagerRepository.saveOtp(otpDetailsDto);
  }
}
