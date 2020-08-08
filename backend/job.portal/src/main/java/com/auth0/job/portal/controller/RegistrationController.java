package com.auth0.job.portal.controller;

import static com.auth0.job.portal.constants.ApplicationConstants.CONTEXT_URL;
import static com.auth0.job.portal.constants.ApplicationConstants.OTP_SUCCESS_MESSAGE;
import static com.auth0.job.portal.constants.ApplicationConstants.REGISTRATION_SUCCESS_MESSAGE;
import static com.auth0.job.portal.constants.ApplicationConstants.SESSION;
import static com.auth0.job.portal.constants.ApplicationConstants.VERIFIED_OTP_MESSAGE;
import static com.auth0.job.portal.converter.OTPRequestConverter.toDto;
import static com.auth0.job.portal.converter.UserConverter.toUserDto;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;

import com.auth0.job.portal.converter.RegisterRequestConverter;
import com.auth0.job.portal.model.ParkedUserDto;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.model.request.RegisterUserRequest;
import com.auth0.job.portal.model.request.VerifyOTPRequest;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.service.SessionManager;
import com.auth0.job.portal.service.UserRegistrationService;
import com.auth0.job.portal.util.Encipher;
import com.auth0.job.portal.util.JwtUtil;
import com.auth0.job.portal.validator.RequestValidator;
import java.util.UUID;
import javax.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(CONTEXT_URL + "/register/v1")
@RequiredArgsConstructor
public class RegistrationController {

  private final UserRegistrationService userRegistrationService;
  private final SessionManager sessionManager;
  private final RegisterRequestConverter registerRequestConverter;
  private final RequestValidator requestValidator;
  private final JwtUtil jwtUtil;
  private final Encipher encipher;

  @PostMapping("/register-user")
  public ResponseEntity<JobPortalResponse> registerUser(
      @Valid @RequestBody RegisterUserRequest registerUserRequest) {

    UserDto userDto = userRegistrationService
        .registerUser(
            toUserDto(registerUserRequest, encipher.encrypt(registerUserRequest.getPassword())));
    return ResponseEntity.status(HttpStatus.CREATED)
        .headers(httpHeaders -> {
          httpHeaders.add(AUTHORIZATION, jwtUtil.generateToken(userDto.getUserId().toString()));
          httpHeaders.add(SESSION,sessionManager.generateSession(userDto));
        })
        .body(buildJobPortalResponse(null, REGISTRATION_SUCCESS_MESSAGE));
  }

  @PostMapping("/step-one")
  public ResponseEntity<JobPortalResponse> registrationStepOne(
      @Valid @RequestBody RegisterUserRequest registerUserRequest) {
    ParkedUserDto parkedUserDto = userRegistrationService
        .registrationStepOne(registerRequestConverter.toParkedUserDto(registerUserRequest));

    return ResponseEntity.status(HttpStatus.CREATED).body(registerRequestConverter.toResponse(
        parkedUserDto));
  }

  @PostMapping("/verify-otp")
  public ResponseEntity<JobPortalResponse> verifyOTP(
      @Valid @RequestBody VerifyOTPRequest verifyOTPRequest) {
    String userId = userRegistrationService.verifyOTP(toDto(verifyOTPRequest));
    return ResponseEntity.status(HttpStatus.OK)
        .headers(httpHeaders -> httpHeaders.add(AUTHORIZATION, jwtUtil.generateToken(userId)))
        .body(buildJobPortalResponse(null, VERIFIED_OTP_MESSAGE));
  }

  @GetMapping("/resend-otp/{userId}")
  public ResponseEntity<JobPortalResponse> resendOtp(@PathVariable(value = "userId") String userId,
      @RequestParam(value = "newRequired", defaultValue = "false", required = false) Boolean newRequired) {
    return ResponseEntity.ok().body(buildJobPortalResponse(userRegistrationService
            .resendOTP(requestValidator.validateAndReturnUserId(userId), newRequired),
        OTP_SUCCESS_MESSAGE));
  }

  @GetMapping("/is-backed-running")
  public ResponseEntity<String> test() {
    return ResponseEntity.ok("Yes I am running!!");
  }

  private JobPortalResponse buildJobPortalResponse(UUID userId, String message) {
    return JobPortalResponse.builder()
        .userId(userId)
        .message(message)
        .build();
  }
}
