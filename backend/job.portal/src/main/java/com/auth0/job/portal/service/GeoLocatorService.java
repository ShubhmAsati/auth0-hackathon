package com.auth0.job.portal.service;

import com.auth0.job.portal.enums.TypesEnum;
import com.auth0.job.portal.model.response.ClubbedJobProfileResponse;
import com.auth0.job.portal.repository.GeoLocationRepository;
import com.google.maps.model.LatLng;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class GeoLocatorService {

  private final GeoLocationRepository geoLocationRepository;
  private final JobPostService jobPostService;
  private final GeoCodingService geoCodingService;


  public ClubbedJobProfileResponse getJobsByCoordinates(UUID userId, Double latitude,
      Double longitude,
      String jobType,
      Integer radius) {
    Double[] latLongs = calculateGeoLocDiff(latitude, longitude, radius);

    List<UUID> jobs = geoLocationRepository.getObjectsByCoordinatesAndType(latitude, longitude,
        latLongs, TypesEnum.JOB);

    ClubbedJobProfileResponse clubbedJobProfileResponse = jobPostService
        .getJobByIdsMatchingJobType(jobs, userId, jobType);

    log.info("Response : {}", clubbedJobProfileResponse);
    return clubbedJobProfileResponse;
  }

  public ClubbedJobProfileResponse getJobsByLocation(UUID userId, String area, String city,
      String jobType,
      Integer radius) {
    //call google api
    LatLng latLng = geoCodingService.getCoordinates(area + " " + city);
    double latitude = latLng.lat;
    double longitude = latLng.lng;
    Double[] latLongs = calculateGeoLocDiff(latitude, longitude, radius);
    List<UUID> jobs = geoLocationRepository.getObjectsByCoordinatesAndType(latitude, longitude,
        latLongs, TypesEnum.JOB);

    return jobPostService.getJobByIdsMatchingJobType(jobs, userId, jobType);
  }

  public ClubbedJobProfileResponse getUsersByCoordinates(UUID userId, Double latitude,
      Double longitude,
      Integer radius,
      TypesEnum type) {
    Double[] latLongs = calculateGeoLocDiff(latitude, longitude, radius);

    List<UUID> users = geoLocationRepository.getObjectsByCoordinatesAndType(latitude, longitude,
        latLongs, type);

    return null;
  }

  public ClubbedJobProfileResponse getUsersByLocation(UUID userId, String area, String city,
      Integer radius,
      TypesEnum type) {
    //call google api
    LatLng latLng = geoCodingService.getCoordinates(area + " " + city);
    double latitude = latLng.lat;
    double longitude = latLng.lng;
    Double[] latLongs = calculateGeoLocDiff(latitude, longitude, radius);

    List<UUID> users = geoLocationRepository.getObjectsByCoordinatesAndType(latitude, longitude,
        latLongs, type);

    return null;
  }


  private static Double[] calculateGeoLocDiff(double latitude, double longitude, int dist) {
//        Latitude: 1 deg = 110.574 km
//        Longitude: 1 deg = 111.320*cos(latitude) km   Approx
    Double[] result = new Double[4];
    double LAT_CONSTANT = 110.574;
    double LONGI_CONSTANT = 111.320;
    double latMax = latitude;
    latMax += (dist / LAT_CONSTANT);
    double latMin = latitude;
    latMin -= (dist / LAT_CONSTANT);

    double longiMax = longitude;
    longiMax += (dist / (LONGI_CONSTANT * Math.cos(latMax)));
    double longiMin = longitude;
    longiMin -= (dist / (LONGI_CONSTANT * Math.cos(latMin)));

    result[0] = latMax;
    result[1] = longiMax;

    result[2] = latMin;
    result[3] = longiMin;

    return result;
  }


}
