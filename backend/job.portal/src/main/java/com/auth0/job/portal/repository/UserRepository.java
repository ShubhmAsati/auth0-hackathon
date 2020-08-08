package com.auth0.job.portal.repository;

import static com.auth0.job.portal.converter.UserConverter.toUserDto;
import static com.auth0.job.portal.converter.UserConverter.toUserEntity;

import com.auth0.job.portal.exception.NotFoundException;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.repository.jpa.JpaUsersRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserRepository {

  private final JpaUsersRepository jpaUsersRepository;

  public UserDto findUserByMobileNumber(String mobileNumber) {
    return toUserDto(jpaUsersRepository.findByMobileNumber(mobileNumber)
        .orElseThrow(() -> new NotFoundException("User does not exist.")));
  }

  public UserDto findUserById(UUID userId) {
    return toUserDto(jpaUsersRepository.findById(userId)
        .orElseThrow(() -> new NotFoundException("User does not exist.")));
  }


  public UserDto saveUser(UserDto userDto) {
    return toUserDto(jpaUsersRepository.save(toUserEntity(userDto)));
  }
}
