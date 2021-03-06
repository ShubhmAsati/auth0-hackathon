package com.auth0.job.portal.repository;

import com.auth0.job.portal.converter.RegisterRequestConverter;
import com.auth0.job.portal.entity.ParkedUserEntity;
import com.auth0.job.portal.exception.UserAlreadyExistException;
import com.auth0.job.portal.exception.NotFoundException;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.repository.jpa.JpaParkedUserRepository;
import com.auth0.job.portal.repository.jpa.JpaUsersRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ParkedUserRepository {

  private final JpaParkedUserRepository jpaParkedUserRepository;
  private final RegisterRequestConverter registerRequestConverter;
  private final JpaUsersRepository jpaUsersRepository;

  public ParkedUserDto saveParkedUser(ParkedUserDto parkedUserDto, Boolean isValidationRequired) {
    if (isValidationRequired) {
      parkedUserDto.setTempUserId(validateUserAndReturnUserId(parkedUserDto));
    }
    return registerRequestConverter
        .toParkedUserDto(jpaParkedUserRepository.save(registerRequestConverter.toParkedUserEntity(
            parkedUserDto)));
  }

  private UUID validateUserAndReturnUserId(ParkedUserDto parkedUserDto) {
    if (jpaUsersRepository.findByMobileNumber(parkedUserDto.getMobileNumber()).isPresent()) {
      throw new UserAlreadyExistException("User exist, cannot update the entity.");
    }
    ParkedUserEntity parkedUserEntity = jpaParkedUserRepository
        .findByMobileNumber(parkedUserDto.getMobileNumber()).orElse(null);
    return parkedUserEntity != null ? parkedUserEntity.getId() : null;
  }

  public ParkedUserDto getParkedUserById(UUID userId) {
    return registerRequestConverter.toParkedUserDto(jpaParkedUserRepository.findById(userId)
        .orElseThrow(() -> new NotFoundException("User does not exist.")));
  }
}
