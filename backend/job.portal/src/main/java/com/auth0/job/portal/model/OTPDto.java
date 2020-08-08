package com.auth0.job.portal.model;

import java.util.UUID;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OTPDto {

  private UUID userId;
  private Integer otp;

}
