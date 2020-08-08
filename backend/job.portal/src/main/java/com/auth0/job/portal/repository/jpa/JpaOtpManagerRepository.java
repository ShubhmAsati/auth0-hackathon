package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.OtpManagerEntity;
import com.auth0.job.portal.enums.OtpType;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaOtpManagerRepository extends JpaRepository<OtpManagerEntity, UUID> {

  Optional<OtpManagerEntity> findByUserIdAndOtpType(UUID userId, OtpType otpType);

}
