package com.auth0.job.portal.config.messaging.service.config;

import com.auth0.job.portal.config.PropertyConfig;
import com.twilio.Twilio;
import javax.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class TwilioConfig {

  private final PropertyConfig propertyConfig;

  @PostConstruct
  public void initializeTwilio(){
    Twilio.init(propertyConfig.getTwilioAccountId(),propertyConfig.getTwilioAccountToken());
  }

}
