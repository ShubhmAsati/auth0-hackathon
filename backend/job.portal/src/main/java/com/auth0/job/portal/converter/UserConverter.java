package com.auth0.job.portal.converter;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static java.util.UUID.fromString;

import com.auth0.job.portal.entity.AddressEntity;
import com.auth0.job.portal.entity.UserDetailsEntity;
import com.auth0.job.portal.entity.UsersEntity;
import com.auth0.job.portal.model.Address;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.model.request.RegisterUserRequest;
import com.auth0.job.portal.model.request.UserRequest;
import com.auth0.job.portal.model.response.AddressResponse;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.model.response.UserDetailsResponse;
import com.auth0.job.portal.model.response.UserResponse;
import java.util.UUID;

public class UserConverter {

  private UserConverter() {
  }

  public static UserDto toUserDto(UsersEntity usersEntity) {
    return UserDto.builder()
        .userId(usersEntity.getId())
        .userType(usersEntity.getUserType())
        .mobileNumber(usersEntity.getMobileNumber())
        .password(usersEntity.getPassword())
        .isActive(usersEntity.getIsActive())
        .userDetailsDto(buildUserDetailDto(usersEntity.getUserDetailsEntity()))
        .build();
  }

  private static UserDetailsDto buildUserDetailDto(UserDetailsEntity userDetailsEntity) {
    return UserDetailsDto.builder()
        .userDetailsId(userDetailsEntity.getId())
        .firstName(userDetailsEntity.getFirstName())
        .lastName(userDetailsEntity.getLastName())
        .email(userDetailsEntity.getEmail())
        .address(userDetailsEntity.getAddress()!=null?buildAddressDto(userDetailsEntity.getAddress()):null)
        .build();
  }

  private static Address buildAddressDto(AddressEntity address) {
    return Address.builder()
        .addressId(address.getId())
        .addressLine1(address.getAddressLine1())
        .city(address.getCity())
        .country(address.getCountry())
        .landmark(address.getLandmark())
        .pinCode(address.getPinCode())
        .state(address.getState())
        .build();
  }

  public static UserDto toUserDto(ParkedUserDto parkedUserDto) {
    return UserDto.builder()
        .mobileNumber(parkedUserDto.getMobileNumber())
        .password(parkedUserDto.getPassword())
        .isActive(TRUE)
        .isVerified(FALSE)
        .userDetailsDto(buildUserDetailDto(parkedUserDto))
        .build();
  }

  private static UserDetailsDto buildUserDetailDto(ParkedUserDto parkedUserDto) {
    return UserDetailsDto.builder()
        .firstName(parkedUserDto.getFirstName())
        .lastName(parkedUserDto.getLastName())
        .build();
  }

  public static UserDto toUserDto(RegisterUserRequest registerUserRequest, String password) {
    return UserDto.builder()
        .mobileNumber(registerUserRequest.getMobileNumber())
        .password(password)
        .isActive(TRUE)
        .isVerified(FALSE)
        .userDetailsDto(buildUserDetailDto(registerUserRequest))
        .build();
  }

  private static UserDetailsDto buildUserDetailDto(RegisterUserRequest registerUserRequest) {
    return UserDetailsDto.builder()
        .firstName(registerUserRequest.getFirstName())
        .lastName(registerUserRequest.getLastName())
        .build();
  }

  public static UsersEntity toUserEntity(UserDto userDto) {
    return UsersEntity.builder()
        .id(userDto.getUserId())
        .isActive(userDto.getIsActive())
        .mobileNumber(userDto.getMobileNumber())
        .password(userDto.getPassword())
        .userType(userDto.getUserType())
        .isVerified(userDto.getIsVerified())
        .userDetailsEntity(buildUserDetailsEntity(userDto.getUserDetailsDto()))
        .build();
  }

  private static UserDetailsEntity buildUserDetailsEntity(UserDetailsDto userDetailsDto) {
    return UserDetailsEntity.builder()
        .id(userDetailsDto.getUserDetailsId())
        .email(userDetailsDto.getEmail())
        .firstName(userDetailsDto.getFirstName())
        .lastName(userDetailsDto.getLastName())
        .address(userDetailsDto.getAddress()!=null?buildAddressEntity(userDetailsDto.getAddress()):new AddressEntity())
        .build();
  }

  private static AddressEntity buildAddressEntity(Address address) {
    return AddressEntity.builder()
        .id(address.getAddressId())
        .addressLine1(address.getAddressLine1())
        .city(address.getCity())
        .country(address.getCountry())
        .landmark(address.getLandmark())
        .pinCode(address.getPinCode())
        .state(address.getState())
        .build();
  }

  public static UserResponse toUserResponse(UserDto userDto) {
    return UserResponse.builder()
        .mobileNumber(userDto.getMobileNumber())
        .userType(userDto.getUserType())
        .userDetails(buildUserDetailsResponse(userDto.getUserDetailsDto()))
        .build();
  }

  private static UserDetailsResponse buildUserDetailsResponse(UserDetailsDto userDetailsDto) {
    return UserDetailsResponse.builder()
        .email(userDetailsDto.getEmail())
        .firstName(userDetailsDto.getFirstName())
        .lastName(userDetailsDto.getLastName())
        .address(buildAddressResponse(userDetailsDto.getAddress()))
        .build();
  }

  private static AddressResponse buildAddressResponse(Address address) {
    return AddressResponse.builder()
        .addressLine1(address.getAddressLine1())
        .city(address.getCity())
        .country(address.getCountry())
        .landmark(address.getLandmark())
        .pinCode(address.getPinCode())
        .state(address.getState())
        .build();
  }

  public JobPortalResponse toResponse(ParkedUserDto parkedUserDto) {
    return JobPortalResponse.builder().userId(parkedUserDto.getTempUserId()).build();
  }

  public static UserDto toUserDto(UserRequest userRequest, String userId){
    return UserDto.builder()
        .userId(fromString(userId))
        .mobileNumber(userRequest.getMobileNumber())
        .userDetailsDto(buildUserDetailDto(userRequest))
        .build();
  }

  private static UserDetailsDto buildUserDetailDto(UserRequest userRequest) {
    return UserDetailsDto.builder()
        .firstName(userRequest.getFirstName())
        .lastName(userRequest.getLastName())
        .email(userRequest.getEmail())
        .address(buildAddressDto(userRequest))
        .build();
  }

  private static Address buildAddressDto(UserRequest userRequest) {
    return Address.builder()
        .addressLine1(userRequest.getAddressLine1())
        .city(userRequest.getCity())
        .country(userRequest.getCountry())
        .landmark(userRequest.getLandmark())
        .pinCode(userRequest.getPinCode() != null? Integer.valueOf(userRequest.getPinCode()): null)
        .state(userRequest.getState())
        .build();
  }

}
