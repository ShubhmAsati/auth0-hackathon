package com.auth0.job.portal.model;

import java.util.Optional;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SearchJobDto {

  private Optional<Double> latitude;
  private Optional<Double> longitude;
  private Optional<String> area;
  private Optional<String> city;
  private Optional<String> jobType;
  private Optional<Integer> radius;
  
}
