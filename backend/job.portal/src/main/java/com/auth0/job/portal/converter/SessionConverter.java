package com.auth0.job.portal.converter;

import com.auth0.job.portal.entity.SessionEntity;
import com.auth0.job.portal.model.Session;

public class SessionConverter {

  private SessionConverter(){}

  public static Session toModel(SessionEntity sessionEntity){
    return Session.builder()
        .sessionId(sessionEntity.getSessionId())
        .userId(sessionEntity.getUserId())
        .build();
  }

  public static SessionEntity toEntity(Session session){
    return SessionEntity.builder()
        .sessionId(session.getSessionId())
        .userId(session.getUserId())
        .build();
  }

}
