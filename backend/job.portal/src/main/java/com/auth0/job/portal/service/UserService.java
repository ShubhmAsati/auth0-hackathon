package com.auth0.job.portal.service;

import static java.util.UUID.fromString;
import static org.apache.logging.log4j.util.Strings.isNotBlank;

import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.repository.UserRepository;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

  private final UserRepository userRepository;

  public UserDto updateUser(UserDto userDto) {
    UserDto presentDetails = userRepository.findUserById(userDto.getUserId());
    return userRepository.saveUser(updateUserDetails(userDto, presentDetails));
  }

  private UserDto updateUserDetails(UserDto userDto, UserDto presentDetails) {
    if (isNotBlank(userDto.getMobileNumber())) {
      presentDetails.setMobileNumber(userDto.getMobileNumber());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getAddress().getCity())) {
      presentDetails.getUserDetailsDto().getAddress()
          .setCity(userDto.getUserDetailsDto().getAddress().getCity());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getEmail())) {
      presentDetails.getUserDetailsDto().setEmail(userDto.getUserDetailsDto().getEmail());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getFirstName())) {
      presentDetails.getUserDetailsDto().setFirstName(userDto.getUserDetailsDto().getFirstName());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getLastName())) {
      presentDetails.getUserDetailsDto().setLastName(userDto.getUserDetailsDto().getLastName());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getAddress().getAddressLine1())) {
      presentDetails.getUserDetailsDto().getAddress()
          .setAddressLine1(userDto.getUserDetailsDto().getAddress().getAddressLine1());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getAddress().getCountry())) {
      presentDetails.getUserDetailsDto().getAddress()
          .setCountry(userDto.getUserDetailsDto().getAddress().getCountry());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getAddress().getLandmark())) {
      presentDetails.getUserDetailsDto().getAddress()
          .setLandmark(userDto.getUserDetailsDto().getAddress().getLandmark());
    }
    if (userDto.getUserDetailsDto().getAddress().getPinCode() != null) {
      presentDetails.getUserDetailsDto().getAddress()
          .setPinCode(userDto.getUserDetailsDto().getAddress().getPinCode());
    }
    if (isNotBlank(userDto.getUserDetailsDto().getAddress().getState())) {
      presentDetails.getUserDetailsDto().getAddress()
          .setState(userDto.getUserDetailsDto().getAddress().getState());
    }
    return presentDetails;
  }

  public UserDto getUserById(String userId) {
    return userRepository.findUserById(fromString(userId));
  }
}
