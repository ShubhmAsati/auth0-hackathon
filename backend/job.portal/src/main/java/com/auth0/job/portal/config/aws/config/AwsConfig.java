package com.auth0.job.portal.config.aws.config;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.auth0.job.portal.config.PropertyConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class AwsConfig {

  private final PropertyConfig propertyConfig;


  @Bean
  public AWSCredentials credentials(){
    return new BasicAWSCredentials(propertyConfig.getAccessKey(), propertyConfig.getSecretKey());
  }

  @Bean
  public AmazonS3 amazonS3(AWSCredentials credentials) {
    return AmazonS3ClientBuilder
        .standard()
        .withCredentials(new AWSStaticCredentialsProvider(credentials))
        .withRegion(Regions.AP_SOUTH_1)
        .build();
  }

}
