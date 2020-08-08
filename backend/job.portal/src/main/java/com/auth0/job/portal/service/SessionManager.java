package com.auth0.job.portal.service;

import com.auth0.job.portal.model.Session;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.repository.SessionRepository;
import com.auth0.job.portal.util.Encipher;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SessionManager {

  private final SessionRepository sessionRepository;
  private final Encipher encipher;

  public String generateSession(UserDto userDto){
    return sessionRepository.saveSession(buildSession(userDto)).getSessionId();
  }

  private Session buildSession(UserDto userDto) {
    return Session.builder()
        .userId(userDto.getUserId())
        .sessionId(encipher.generateUserHash(userDto.getUserId(),userDto.getMobileNumber()))
        .build();
  }

}
