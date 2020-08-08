package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.SessionEntity;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JpaSessionRepository extends JpaRepository<SessionEntity, UUID> {

  Optional<SessionEntity> findBySessionId(String sessionId);

}
