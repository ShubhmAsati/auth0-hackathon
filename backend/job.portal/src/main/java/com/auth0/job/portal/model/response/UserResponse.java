package com.auth0.job.portal.model.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonInclude(Include.NON_NULL)
public class UserResponse {

  private String mobileNumber;

  private String userType;

  private UserDetailsResponse userDetails;

}
