package com.auth0.job.portal.controller;

import static com.auth0.job.portal.constants.ApplicationConstants.CONTEXT_URL;
import static com.auth0.job.portal.converter.UserConverter.toUserDto;
import static org.apache.http.HttpHeaders.AUTHORIZATION;

import com.auth0.job.portal.converter.UserConverter;
import com.auth0.job.portal.model.request.UserRequest;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.model.response.UserResponse;
import com.auth0.job.portal.service.UserService;
import com.auth0.job.portal.util.JwtUtil;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(CONTEXT_URL + "/user/v1")
public class UserController {

  private final UserService userService;
  private final JwtUtil jwtUtil;

  @PutMapping
  public ResponseEntity<UserResponse> updateUser(@Valid @RequestBody UserRequest userRequest,
      @RequestHeader(AUTHORIZATION) String token) {
    return ResponseEntity.ok(UserConverter.toUserResponse(
        userService.updateUser(toUserDto(userRequest, jwtUtil.extractUserId(token)))));
  }

  @GetMapping
  public ResponseEntity<UserResponse> getUser(@RequestHeader(AUTHORIZATION) String token) {
    return ResponseEntity.ok(UserConverter.toUserResponse(
        userService.getUserById(jwtUtil.extractUserId(token))));
  }

}
