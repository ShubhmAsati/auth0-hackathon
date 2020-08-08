package com.auth0.job.portal.model.request;

import com.auth0.job.portal.validator.UUID;
import lombok.Data;

@Data
public class ResendOtpRequest {

  @UUID
  private String userId;

}
