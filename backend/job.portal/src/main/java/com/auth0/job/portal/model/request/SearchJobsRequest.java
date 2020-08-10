package com.auth0.job.portal.model.request;

import lombok.Data;

@Data
public class SearchJobsRequest {
  
  private Double latitude;
  private Double longitude;
  private String area;
  private String city;
  private String jobType;
  private Integer radius;
}
