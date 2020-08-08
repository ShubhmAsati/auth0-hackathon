package com.auth0.job.portal.service;

import static com.auth0.job.portal.converter.UserConverter.toUserDto;
import static com.auth0.job.portal.enums.OtpType.REGISTER;
import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;

import com.auth0.job.portal.exception.UserAlreadyExistException;
import com.auth0.job.portal.model.OTPDto;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.repository.ParkedUserRepository;
import com.auth0.job.portal.repository.UserRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserRegistrationService {

  private final ParkedUserRepository parkedUserRepository;
  private final UserRepository userRepository;
  private final OTPService otpService;

  public UserDto registerUser(UserDto userDto) {
    validateUser(userDto.getMobileNumber());
    return userRepository.saveUser(userDto);
  }

  private void validateUser(String mobileNumber) {
    if (userRepository.isUserExist(mobileNumber)) {
      throw new UserAlreadyExistException("User exist, cannot update the entity.");
    }
  }

  public ParkedUserDto registrationStepOne(ParkedUserDto parkedUserDto) {
    ParkedUserDto parkedUserDto1 = parkedUserRepository.saveParkedUser(parkedUserDto, TRUE);
    otpService.generateAndSendOTP(parkedUserDto1.getTempUserId(), parkedUserDto1.getMobileNumber(),
        REGISTER);
    return parkedUserDto1;
  }


  public String verifyOTP(OTPDto otpDto) {
    otpService.validateOtp(otpDto, REGISTER);
    ParkedUserDto parkedUserDto = parkedUserRepository.getParkedUserById(otpDto.getUserId());
    parkedUserDto.setIsVerified(TRUE);
    parkedUserRepository.saveParkedUser(parkedUserDto, FALSE);
    return userRepository.saveUser(toUserDto(parkedUserDto)).getUserId().toString();
  }

  public UUID resendOTP(UUID userId, Boolean isNewOTPRequired) {
    ParkedUserDto parkedUserDto = parkedUserRepository.getParkedUserById(userId);
    otpService
        .resendOTP(parkedUserDto.getTempUserId(), parkedUserDto.getMobileNumber(), isNewOTPRequired,
            REGISTER);
    return userId;
  }
}
