package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.UserDetailsEntity;
import java.util.UUID;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDetailsRepository extends CrudRepository<UserDetailsEntity, UUID> {

}
