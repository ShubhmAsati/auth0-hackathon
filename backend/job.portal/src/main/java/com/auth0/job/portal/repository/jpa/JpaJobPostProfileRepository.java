package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.JobPostProfileEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface JpaJobPostProfileRepository extends JpaRepository<JobPostProfileEntity, UUID> {

    Page<JobPostProfileEntity> findByUserId(UUID id, Pageable pageable);

    Page<JobPostProfileEntity> findByIdIn(List<UUID> ids, Pageable pageable);

    void deleteById(UUID id);

}
