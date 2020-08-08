package com.auth0.job.portal.model;

import java.util.UUID;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ParkedUserDto {

  private UUID tempUserId;

  private String mobileNumber;

  private String password;

  private String firstName;

  private String lastName;

  private Boolean isVerified;


}
