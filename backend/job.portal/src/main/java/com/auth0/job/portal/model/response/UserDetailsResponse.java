package com.auth0.job.portal.model.response;

import com.auth0.job.portal.model.Address;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDetailsResponse {

  private String email;

  private String firstName;

  private String lastName;

  private AddressResponse address;

}
