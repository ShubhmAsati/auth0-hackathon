package com.auth0.job.portal.repository;

import com.auth0.job.portal.constants.ApplicationConstants;
import com.auth0.job.portal.entity.JobPostProfileEntity;
import com.auth0.job.portal.repository.jpa.JpaJobPostProfileRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class JobPostProfileRepository {

    static int jobsPerPage= ApplicationConstants.JOBS_PER_PAGE;


    private  final JpaJobPostProfileRepository jpaJobPostProfileRepository;

    public Optional<JobPostProfileEntity> findById(UUID id){
        return jpaJobPostProfileRepository.findById(id);
    }

    public List<JobPostProfileEntity> findByIdIn(List<UUID> ids){
        return jpaJobPostProfileRepository.findByIdIn(ids);
    }

    public List<JobPostProfileEntity> findByUserId(UUID userId){
        return jpaJobPostProfileRepository.findByUserId(userId);
    }

//    public Page<JobPostProfileEntity> findByBetweenLocationUUID userId,int radius){
//        return jpaJobPostProfileRepository.findByUserId(userId, PageRequest.of(pageNo,jobsPerPage, Sort.Direction.DESC,"updated_at"));
//    }





    public JobPostProfileEntity saveJob(JobPostProfileEntity jobPostProfileEntity){
        return jpaJobPostProfileRepository.save(jobPostProfileEntity);
    }

    public void deleteByJobiId(UUID jobId){
         jpaJobPostProfileRepository.deleteById(jobId);
    }




}
