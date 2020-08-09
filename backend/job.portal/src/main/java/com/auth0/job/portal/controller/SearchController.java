package com.auth0.job.portal.controller;

import com.auth0.job.portal.constants.ApplicationConstants;

import com.auth0.job.portal.enums.TypesEnum;
import com.auth0.job.portal.service.GeoLocatorService;
import com.auth0.job.portal.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

import static org.apache.http.HttpHeaders.AUTHORIZATION;

@RestController
@RequestMapping(name= ApplicationConstants.SEARCH)
@RequiredArgsConstructor
public class SearchController {

    private final GeoLocatorService geoLocatorService;
    private final JwtUtil jwtUtil;

    //retrieve
    @GetMapping("/jobs")
    public ResponseEntity<?> getJobs
            ( @RequestHeader(AUTHORIZATION) String token,
              @RequestParam(value = "searchLocationLat",required = false) Optional<Double> latitude,
              @RequestParam(value="searchLocationLng",required = false)Optional<Double> longitude,
              @RequestParam(value="locality",required = false)Optional<String> area,
              @RequestParam(value="city",required = false)Optional<String> city,
              @RequestParam(value="jobType",required = false)Optional<String> jobType,
              @RequestParam(value="radius",required = false)Optional<Integer> radius){
        if(latitude.isPresent() && longitude.isPresent())
            return ResponseEntity.status(HttpStatus.FOUND)
                    .body(geoLocatorService.getJobsByCoordinates(UUID.fromString(jwtUtil.extractUserId(token)),
                            latitude.get(),longitude.get(),
                            jobType.orElse(""),
                            radius.orElse(ApplicationConstants.DEFAULT_RADIUS)));
        else if(area.isPresent() || city.isPresent())
            return ResponseEntity.status(HttpStatus.FOUND)
                    .body(geoLocatorService.getJobsByLocation(UUID.fromString(jwtUtil.extractUserId(token)),
                            area.orElse(city.get()),city.orElse(area.get()),
                            jobType.orElse(""),
                            radius.orElse(ApplicationConstants.DEFAULT_RADIUS)));


        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ApplicationConstants.INSUFFICIENT_SEARCH_PARAMETERS);
    }

    @GetMapping("/users")
    public ResponseEntity<?> getUsers
            ( @RequestHeader(AUTHORIZATION) String token,
              @RequestParam(value="latitude",required = false) Optional<Double> latitude,
              @RequestParam(value="longitude",required = false)Optional<Double> longitude,
              @RequestParam(value="area",required = false)Optional<String> area,
              @RequestParam(value="city",required = false)Optional<String> city,
              @RequestParam(value="radius",required = false)Optional<Integer> radius,
              @RequestParam(value="type",required = false)Optional<String> type){
        if(latitude.isPresent() && longitude.isPresent())
            return ResponseEntity.status(HttpStatus.FOUND)
                    .body(geoLocatorService.getUsersByCoordinates(UUID.fromString(jwtUtil.extractUserId(token)),
                            latitude.get(),longitude.get(),
                            radius.orElse(ApplicationConstants.DEFAULT_RADIUS),
                            Enum.valueOf(TypesEnum.class,type.orElse(TypesEnum.SEEKER.toString()))));
        else if(area.isPresent() || city.isPresent())
            return ResponseEntity.status(HttpStatus.FOUND)
                    .body(geoLocatorService.getUsersByLocation(UUID.fromString(jwtUtil.extractUserId(token)),
                            area.orElse(city.get()),city.orElse(area.get()),
                            radius.orElse(ApplicationConstants.DEFAULT_RADIUS),
                            Enum.valueOf(TypesEnum.class,type.orElse(TypesEnum.SEEKER.toString()))));


        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ApplicationConstants.INSUFFICIENT_SEARCH_PARAMETERS);
    }

//lat,long/ar,city;desc,

}
