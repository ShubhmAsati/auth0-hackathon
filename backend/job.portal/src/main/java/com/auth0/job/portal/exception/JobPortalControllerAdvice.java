package com.auth0.job.portal.exception;

import com.auth0.job.portal.model.response.ErrorResponse;
import java.time.LocalDateTime;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class JobPortalControllerAdvice {

  private static final String INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";
  private static final String VALIDATION_ERROR = "VALIDATION_ERROR";
  private static final String NOT_FOUND_EXCEPTION = "NOT_FOUND_EXCEPTION";

  @ExceptionHandler(Exception.class)
  public ResponseEntity<ErrorResponse> handleException(Exception e) {
    log.info(INTERNAL_SERVER_ERROR, e);
    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
        .body(buildErrorResponse("Something went wrong!!"));
  }

  @ExceptionHandler(ValidationsException.class)
  public ResponseEntity<ErrorResponse> handleValidationsException(ValidationsException e) {
    log.info(VALIDATION_ERROR, e);
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(buildErrorResponse(e.getMessage()));
  }

  @ExceptionHandler(InvalidOTPException.class)
  public ResponseEntity<ErrorResponse> handleInvalidOtpException(InvalidOTPException e) {
    log.info(VALIDATION_ERROR, e);
    return ResponseEntity.status(HttpStatus.FORBIDDEN).body(buildErrorResponse(e.getMessage()));
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  public ResponseEntity<ErrorResponse> handleValidationsException(
      MethodArgumentNotValidException e) {
    log.info(VALIDATION_ERROR, e);
    String message = e.getBindingResult().getFieldErrors().stream().map(
        DefaultMessageSourceResolvable::getDefaultMessage).collect(
        Collectors.joining(", "));
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(buildErrorResponse(message));
  }

  @ExceptionHandler(NotFoundException.class)
  public ResponseEntity<ErrorResponse> handleValidationsException(NotFoundException e) {
    log.info(NOT_FOUND_EXCEPTION, e);
    return ResponseEntity.status(HttpStatus.NOT_FOUND).body(buildErrorResponse(e.getMessage()));
  }

  @ExceptionHandler(EntityAlreadyExistException.class)
  public ResponseEntity<ErrorResponse> handleEntityAlreadyExistException(
      EntityAlreadyExistException e) {
    log.info(VALIDATION_ERROR, e);
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(buildErrorResponse(e.getMessage()));
  }

  private ErrorResponse buildErrorResponse(String message) {
    return ErrorResponse.builder()
        .timeStamp(LocalDateTime.now())
        .errorMessage(message)
        .build();
  }

}
