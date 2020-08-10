package com.auth0.job.portal.converter;

import com.auth0.job.portal.model.SearchJobDto;
import com.auth0.job.portal.model.SearchUserDto;
import com.auth0.job.portal.model.request.SearchJobsRequest;
import com.auth0.job.portal.model.request.SearchUserRequest;
import java.util.Optional;
import org.apache.logging.log4j.util.Strings;

public class SearchDtoConverter {

  SearchDtoConverter(){}

  public static SearchJobDto toDto(SearchJobsRequest searchJobsRequest){
    return SearchJobDto.builder()
        .area(Strings.isNotBlank(searchJobsRequest.getArea())?Optional.of(searchJobsRequest.getArea()):Optional.empty())
        .city(Strings.isNotBlank(searchJobsRequest.getCity())?Optional.of(searchJobsRequest.getCity()):Optional.empty())
        .jobType(Strings.isNotBlank(searchJobsRequest.getJobType())?Optional.of(searchJobsRequest.getJobType()):Optional.empty())
        .latitude(searchJobsRequest.getLatitude()!=null?Optional.of(searchJobsRequest.getLatitude()):Optional.empty())
        .longitude(searchJobsRequest.getLongitude()!=null?Optional.of(searchJobsRequest.getLongitude()):Optional.empty())
        .radius(searchJobsRequest.getRadius()!=null?Optional.of(searchJobsRequest.getRadius()):Optional.empty())
        .build();
  }

  public static SearchUserDto toDto(SearchUserRequest searchUserRequest){
    return SearchUserDto.builder()
        .area(Strings.isNotBlank(searchUserRequest.getArea())?Optional.of(searchUserRequest.getArea()):Optional.empty())
        .city(Strings.isNotBlank(searchUserRequest.getCity())?Optional.of(searchUserRequest.getCity()):Optional.empty())
        .type(Strings.isNotBlank(searchUserRequest.getType())?Optional.of(searchUserRequest.getType()):Optional.empty())
        .latitude(searchUserRequest.getLatitude()!=null?Optional.of(searchUserRequest.getLatitude()):Optional.empty())
        .longitude(searchUserRequest.getLongitude()!=null?Optional.of(searchUserRequest.getLongitude()):Optional.empty())
        .radius(searchUserRequest.getRadius()!=null?Optional.of(searchUserRequest.getRadius()):Optional.empty())
        .build();
  }

}
