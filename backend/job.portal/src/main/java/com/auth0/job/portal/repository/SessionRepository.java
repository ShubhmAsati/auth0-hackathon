package com.auth0.job.portal.repository;


import static com.auth0.job.portal.converter.SessionConverter.toEntity;
import static com.auth0.job.portal.converter.SessionConverter.toModel;

import com.auth0.job.portal.exception.NotFoundException;
import com.auth0.job.portal.model.Session;
import com.auth0.job.portal.repository.jpa.JpaSessionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class SessionRepository {

  private final JpaSessionRepository jpaSessionRepository;

  public Session getSessionById(String sessionId){
    return toModel(jpaSessionRepository.findBySessionId(sessionId).orElseThrow(() -> new NotFoundException("session expired or invalid session id")));

  }

  public Session saveSession(Session session){
    return toModel(jpaSessionRepository.save(toEntity(session)));
  }

}
