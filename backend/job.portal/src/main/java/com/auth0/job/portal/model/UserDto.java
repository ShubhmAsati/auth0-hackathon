package com.auth0.job.portal.model;

import com.auth0.job.portal.enums.UserType;
import java.util.UUID;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDto {

  private UUID userId;

  private String mobileNumber;

  private String password;

  private UserType userType;

  private Boolean isActive;

  private Boolean isVerified;

  private UserDetailsDto userDetailsDto;

}
