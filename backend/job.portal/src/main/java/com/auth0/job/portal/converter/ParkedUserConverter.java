package com.auth0.job.portal.converter;

import static java.lang.Boolean.FALSE;

import com.auth0.job.portal.entity.ParkedUserEntity;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.model.request.RegistrationStepOneRequest;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.util.Encipher;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ParkedUserConverter {

  private final Encipher encipher;

  public ParkedUserDto toParkedUserDto(RegistrationStepOneRequest registrationStepOneRequest) {
    return ParkedUserDto.builder()
        .mobileNumber(registrationStepOneRequest.getMobileNumber())
        .password(encipher.encrypt(registrationStepOneRequest.getPassword()))
        .firstName(registrationStepOneRequest.getFirstName())
        .lastName(registrationStepOneRequest.getLastName())
        .isVerified(FALSE)
        .build();
  }

  public ParkedUserEntity toParkedUserEntity(ParkedUserDto parkedUserDto) {
    return ParkedUserEntity.builder()
        .id(parkedUserDto.getTempUserId())
        .mobileNumber(parkedUserDto.getMobileNumber())
        .password(parkedUserDto.getPassword())
        .firstName(parkedUserDto.getFirstName())
        .lastName(parkedUserDto.getLastName())
        .isVerified(parkedUserDto.getIsVerified())
        .build();
  }

  public ParkedUserDto toParkedUserDto(ParkedUserEntity parkedUserEntity) {
    return ParkedUserDto.builder()
        .tempUserId(parkedUserEntity.getId())
        .mobileNumber(parkedUserEntity.getMobileNumber())
        .password(parkedUserEntity.getPassword())
        .isVerified(parkedUserEntity.getIsVerified())
        .firstName(parkedUserEntity.getFirstName())
        .lastName(parkedUserEntity.getLastName())
        .build();
  }

  public JobPortalResponse toResponse(ParkedUserDto parkedUserDto) {
    return JobPortalResponse.builder().userId(parkedUserDto.getTempUserId()).build();
  }
}
