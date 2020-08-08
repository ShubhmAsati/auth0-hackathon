package com.auth0.job.portal.model.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AddressResponse {

  private String city;

  private String state;

  private String country;

  private Integer pinCode;

  private String addressLine1;

  private String landmark;
}
