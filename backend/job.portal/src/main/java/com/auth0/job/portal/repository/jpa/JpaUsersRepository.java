package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.UsersEntity;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaUsersRepository extends JpaRepository<UsersEntity, UUID> {

  Optional<UsersEntity> findByMobileNumber(String mobileNumber);

}
