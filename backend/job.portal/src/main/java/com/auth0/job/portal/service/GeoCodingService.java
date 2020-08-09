package com.auth0.job.portal.service;

import com.auth0.job.portal.exception.InternalServerException;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class GeoCodingService {

  private final GeoApiContext geoApiContext;

  public LatLng getCoordinates(String address) {
    try {
      GeocodingResult[] results = GeocodingApi.geocode(geoApiContext, address).await();
      return results[0].geometry.location;
    } catch (Exception e) {
      e.printStackTrace();
      throw new InternalServerException();
    }
  }

}
