package com.auth0.job.portal.converter;

import static java.lang.Boolean.TRUE;

import com.auth0.job.portal.entity.AddressEntity;
import com.auth0.job.portal.entity.UserDetailsEntity;
import com.auth0.job.portal.entity.UsersEntity;
import com.auth0.job.portal.model.Address;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.UserDto;

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
        .userDetailsDto(buildUserDetailDto(parkedUserDto))
        .build();
  }

  private static UserDetailsDto buildUserDetailDto(ParkedUserDto parkedUserDto) {
    return UserDetailsDto.builder()
        .firstName(parkedUserDto.getFirstName())
        .lastName(parkedUserDto.getLastName())
        .build();
  }

  public static UsersEntity toUserEntity(UserDto userDto) {
    return UsersEntity.builder()
        .id(userDto.getUserId())
        .isActive(userDto.getIsActive())
        .mobileNumber(userDto.getMobileNumber())
        .password(userDto.getPassword())
        .userType(userDto.getUserType())
        .userDetailsEntity(buildUserDetailsEntity(userDto.getUserDetailsDto()))
        .build();
  }

  private static UserDetailsEntity buildUserDetailsEntity(UserDetailsDto userDetailsDto) {
    return UserDetailsEntity.builder()
        .id(userDetailsDto.getUserDetailsId())
        .email(userDetailsDto.getEmail())
        .firstName(userDetailsDto.getFirstName())
        .lastName(userDetailsDto.getLastName())
        .address(userDetailsDto.getAddress()!=null?buildAddressEntity(userDetailsDto.getAddress()):null)
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

}
