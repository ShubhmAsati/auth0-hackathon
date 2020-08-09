package com.auth0.job.portal.repository;

import static java.util.stream.Collectors.toList;

import com.auth0.job.portal.entity.JobTypeEntity;
import com.auth0.job.portal.repository.jpa.JpaJobTypeRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class JobTypeRepository {

  private final JpaJobTypeRepository jpaJobTypeRepository;

  public List<String> getJobTypes() {
    return jpaJobTypeRepository.findAll().stream().map(JobTypeEntity::getName).collect(toList());
  }

}
