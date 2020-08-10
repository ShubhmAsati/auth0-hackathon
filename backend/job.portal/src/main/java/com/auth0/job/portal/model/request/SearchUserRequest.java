package com.auth0.job.portal.model.request;

import lombok.Data;

@Data
public class SearchUserRequest {

  private Double latitude;
  private Double longitude;
  private String area;
  private String city;
  private String type;
  private Integer radius;
}
