package com.auth0.job.portal.controller;

import com.auth0.job.portal.constants.ApplicationConstants;

import com.auth0.job.portal.enums.TypesEnum;
import com.auth0.job.portal.model.SearchJobDto;
import com.auth0.job.portal.model.SearchUserDto;
import com.auth0.job.portal.model.request.SearchJobsRequest;
import com.auth0.job.portal.model.request.SearchUserRequest;
import com.auth0.job.portal.service.GeoLocatorService;
import com.auth0.job.portal.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

import static com.auth0.job.portal.converter.SearchDtoConverter.toDto;
import static org.apache.http.HttpHeaders.AUTHORIZATION;

@Slf4j
@RestController
@RequestMapping(name= ApplicationConstants.SEARCH)
@RequiredArgsConstructor
public class SearchController {

    private final GeoLocatorService geoLocatorService;
    private final JwtUtil jwtUtil;

    //retrieve
    @PostMapping("/jobs")
    public ResponseEntity<?> getJobs(@RequestBody SearchJobsRequest searchJobsRequest, @RequestHeader(AUTHORIZATION) String token){
        SearchJobDto searchJobDto = toDto(searchJobsRequest);
        log.info("Request {}", searchJobsRequest);
        if(searchJobDto.getLatitude().isPresent() && searchJobDto.getLongitude().isPresent())
            return ResponseEntity.status(HttpStatus.OK)
                    .body(geoLocatorService.getJobsByCoordinates(UUID.fromString(jwtUtil.extractUserId(token)),
                        searchJobDto.getLatitude().get(),searchJobDto.getLongitude().get(),
                        searchJobDto.getJobType().orElse(""),
                        searchJobDto.getRadius().orElse(ApplicationConstants.DEFAULT_RADIUS)));
        else if(searchJobDto.getArea().isPresent() || searchJobDto.getCity().isPresent())
            return ResponseEntity.status(HttpStatus.OK)
                    .body(geoLocatorService.getJobsByLocation(UUID.fromString(jwtUtil.extractUserId(token)),
                        searchJobDto.getArea().orElse(searchJobDto.getCity().get()),searchJobDto.getCity().orElse(searchJobDto.getArea().get()),
                        searchJobDto.getJobType().orElse(""),
                        searchJobDto.getRadius().orElse(ApplicationConstants.DEFAULT_RADIUS)));


        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ApplicationConstants.INSUFFICIENT_SEARCH_PARAMETERS);
    }

    @PostMapping("/users")
    public ResponseEntity<?> getUsers
            (@RequestBody SearchUserRequest searchUserRequest, @RequestHeader(AUTHORIZATION) String token){
        SearchUserDto searchUserDto = toDto(searchUserRequest);
        if(searchUserDto.getLatitude().isPresent() && searchUserDto.getLongitude().isPresent())
            return ResponseEntity.status(HttpStatus.OK)
                    .body(geoLocatorService.getUsersByCoordinates(UUID.fromString(jwtUtil.extractUserId(token)),
                        searchUserDto.getLatitude().get(),searchUserDto.getLongitude().get(),
                        searchUserDto.getRadius().orElse(ApplicationConstants.DEFAULT_RADIUS),
                            Enum.valueOf(TypesEnum.class,searchUserDto.getType().orElse(TypesEnum.SEEKER.toString()))));
        else if(searchUserDto.getArea().isPresent() || searchUserDto.getCity().isPresent())
            return ResponseEntity.status(HttpStatus.OK)
                    .body(geoLocatorService.getUsersByLocation(UUID.fromString(jwtUtil.extractUserId(token)),
                        searchUserDto.getArea().orElse(searchUserDto.getCity().get()),searchUserDto.getCity().orElse(searchUserDto.getArea().get()),
                        searchUserDto.getRadius().orElse(ApplicationConstants.DEFAULT_RADIUS),
                            Enum.valueOf(TypesEnum.class,searchUserDto.getType().orElse(TypesEnum.SEEKER.toString()))));


        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ApplicationConstants.INSUFFICIENT_SEARCH_PARAMETERS);
    }

//lat,long/ar,city;desc,

}
