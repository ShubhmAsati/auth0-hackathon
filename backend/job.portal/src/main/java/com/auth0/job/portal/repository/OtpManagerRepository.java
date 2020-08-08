package com.auth0.job.portal.repository;

import static com.auth0.job.portal.converter.OtpDetailsConverter.toEntity;
import static com.auth0.job.portal.converter.OtpDetailsConverter.toOtpDetailsDto;

import com.auth0.job.portal.enums.OtpType;
import com.auth0.job.portal.exception.NotFoundException;
import com.auth0.job.portal.model.OtpDetailsDto;
import com.auth0.job.portal.repository.jpa.JpaOtpManagerRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class OtpManagerRepository {

  private final JpaOtpManagerRepository jpaOtpManagerRepository;

  public OtpDetailsDto saveOtp(OtpDetailsDto otpDetailsDto) {
    return toOtpDetailsDto(jpaOtpManagerRepository.save(toEntity(otpDetailsDto)));
  }

  public OtpDetailsDto getOtpDetails(UUID userId, OtpType otpType) {
    return toOtpDetailsDto(jpaOtpManagerRepository.findByUserIdAndOtpType(userId, otpType)
        .orElseThrow(() -> new NotFoundException("User does not exist.")));
  }

  public void deleteByUserId(UUID id) {
    jpaOtpManagerRepository.deleteById(id);
  }

}
