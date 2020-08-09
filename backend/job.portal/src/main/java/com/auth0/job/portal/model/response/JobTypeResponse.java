package com.auth0.job.portal.model.response;

import java.util.List;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class JobTypeResponse {

  private List<String> jobTypes;

}
