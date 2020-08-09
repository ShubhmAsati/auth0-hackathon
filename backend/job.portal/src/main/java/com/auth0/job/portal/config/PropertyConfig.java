package com.auth0.job.portal.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class PropertyConfig {

  @Value("${job.portal.twilio.account.id}")
  private String twilioAccountId;

  @Value("${job.portal.twilio.account.token}")
  private String twilioAccountToken;

  @Value("${job.portal.twilio.account.phone.number}")
  private String twilioAccountPhoneNumber;

  @Value("${job.portal.otp.expiration.time}")
  private Integer otpExpirationTimeInMinutes;

  @Value("${job.portal.otp.resend.count}")
  private Integer otpResendCount;

  @Value("${job.portal.google.geolocation.api.key}")
  private String apiKey;

  @Value("${job.portal.amazon.aws.endpointUrl}")
  private String endpointUrl;

  @Value("${job.portal.amazon.aws.bucketName}")
  private String bucketName;

  @Value("${job.portal.amazon.aws.accessKey}")
  private String accessKey;

  @Value("${job.portal.amazon.aws.secretKey}")
  private String secretKey;

  @Value("${job.portal.file.path.images}")
  private String imagePath;

}
