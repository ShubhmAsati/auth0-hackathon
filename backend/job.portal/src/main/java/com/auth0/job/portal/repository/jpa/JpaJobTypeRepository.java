package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.JobTypeEntity;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaJobTypeRepository extends JpaRepository<JobTypeEntity, UUID> {

}
