package com.auth0.job.portal.controller;

import static com.auth0.job.portal.constants.ApplicationConstants.CONTEXT_URL;
import static com.auth0.job.portal.constants.ApplicationConstants.OTP_SUCCESS_MESSAGE;
import static com.auth0.job.portal.constants.ApplicationConstants.RESET_PASSWORD_MESSAGE;
import static com.auth0.job.portal.constants.ApplicationConstants.VERIFIED_OTP_MESSAGE;
import static com.auth0.job.portal.converter.OTPRequestConverter.toDto;
import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;

import com.auth0.job.portal.model.request.LoginRequest;
import com.auth0.job.portal.model.request.ResendOtpRequest;
import com.auth0.job.portal.model.request.ResetPasswordRequest;
import com.auth0.job.portal.model.request.VerifyOTPRequest;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.service.LoginService;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(CONTEXT_URL + "/login")
@RequiredArgsConstructor
public class LoginController {

  private final LoginService loginService;
  private final RequestValidator requestValidator;
  private final JwtUtil jwtUtil;

  @GetMapping("/v1/login-by-otp/{mobileNumber}")
  public ResponseEntity<JobPortalResponse> loginByMobileNumber(
      @PathVariable("mobileNumber") String mobileNumber) {
    requestValidator.validateMobileNumber(mobileNumber);
    return ResponseEntity.status(HttpStatus.OK).body(
        buildJobPortalResponse(loginService.login(mobileNumber, TRUE), OTP_SUCCESS_MESSAGE));
  }

  @PostMapping("/v1/login-by-password")
  public ResponseEntity<JobPortalResponse> loginByPassword(
      @Valid @RequestBody LoginRequest loginRequest) {
    UUID userId = loginService
        .loginByPassword(loginRequest.getMobileNumber(), loginRequest.getPassword());
    return ResponseEntity.status(HttpStatus.OK).headers(
        httpHeaders -> httpHeaders.add(AUTHORIZATION, jwtUtil.generateToken(userId.toString())))
        .body(buildJobPortalResponse(null, VERIFIED_OTP_MESSAGE));
  }

  @PostMapping("/v1/verify-otp")
  public ResponseEntity<JobPortalResponse> verifyOTP(
      @Valid @RequestBody VerifyOTPRequest verifyOTPRequest,
      @RequestParam(value = "isLoginOTP") Boolean isLoginOTP) {
    UUID userId = loginService.verifyOTP(toDto(verifyOTPRequest), isLoginOTP);
    return ResponseEntity.status(HttpStatus.OK).headers(
        httpHeaders -> httpHeaders.add(AUTHORIZATION, jwtUtil.generateToken(userId.toString())))
        .body(buildJobPortalResponse(null, VERIFIED_OTP_MESSAGE));
  }

  @GetMapping("/v1/forgot-password/{mobileNumber}")
  public ResponseEntity<JobPortalResponse> forgotPassword(
      @PathVariable("mobileNumber") String mobileNumber) {
    requestValidator.validateMobileNumber(mobileNumber);
    return ResponseEntity.status(HttpStatus.OK).body(
        buildJobPortalResponse(loginService.login(mobileNumber, FALSE), OTP_SUCCESS_MESSAGE));
  }

  @PostMapping("/v2/reset-password")
  public ResponseEntity<?> resetPassword(
      @Valid @RequestBody ResetPasswordRequest resetPasswordRequest,
      @RequestHeader(AUTHORIZATION) String token) {
    loginService.resetPassword(resetPasswordRequest.getPassword(), token);
    return ResponseEntity.ok().body(buildJobPortalResponse(null, RESET_PASSWORD_MESSAGE));
  }

  @PostMapping("/v1/resend-otp")
  public ResponseEntity<?> resendOTP(
      @Valid @RequestBody ResendOtpRequest resendOtpRequest,
      @RequestParam(value = "newRequired", defaultValue = "false", required = false) Boolean newRequired) {
    return ResponseEntity.ok().body(
        buildJobPortalResponse(loginService.resendOTP(resendOtpRequest.getUserId(), newRequired),
            OTP_SUCCESS_MESSAGE));
  }

  private JobPortalResponse buildJobPortalResponse(UUID userId, String message) {
    return JobPortalResponse.builder()
        .userId(userId)
        .message(message)
        .build();
  }

}
