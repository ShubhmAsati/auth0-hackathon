package com.auth0.job.portal.config.geo.coding.config;

import com.auth0.job.portal.config.PropertyConfig;
import com.google.maps.GeoApiContext;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class GeoCodingConfig {

  private final PropertyConfig propertyConfig;

  @Bean
  public GeoApiContext geoApiContext() {
    return new GeoApiContext.Builder()
        .apiKey(propertyConfig.getGeoCodingApiKey())
        .build();
  }

}
