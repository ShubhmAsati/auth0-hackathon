package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.AddressEntity;
import java.util.UUID;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends CrudRepository<AddressEntity, UUID> {
}
