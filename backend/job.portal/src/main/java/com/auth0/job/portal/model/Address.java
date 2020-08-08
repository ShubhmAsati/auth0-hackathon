package com.auth0.job.portal.model;

import java.util.UUID;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Address {

  private UUID addressId;

  private String city;

  private String state;

  private String country;

  private Integer pinCode;

  private String addressLine1;

  private String landmark;

  private GeoLocationDto geoLocationDto;

}
