package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.ParkedUserEntity;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaParkedUserRepository extends JpaRepository<ParkedUserEntity, UUID> {

  Optional<ParkedUserEntity> findByMobileNumber(String mobileNumber);

}
