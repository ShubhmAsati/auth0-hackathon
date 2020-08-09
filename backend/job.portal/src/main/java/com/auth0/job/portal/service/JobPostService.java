package com.auth0.job.portal.service;

import com.auth0.job.portal.converter.JobPostProfileConverter;

import com.auth0.job.portal.converter.UserConverter;
import com.auth0.job.portal.entity.GeoLocationEntity;
import com.auth0.job.portal.entity.JobPostProfileEntity;
import com.auth0.job.portal.enums.TypesEnum;
import com.auth0.job.portal.exception.jobs.InvalidJobIdException;
import com.auth0.job.portal.exception.jobs.JobFinderBaseException;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.model.request.JobProfileRequest;

import com.auth0.job.portal.model.response.ClubbedJobProfileResponse;
import com.auth0.job.portal.model.response.JobProfileResponse;
import com.auth0.job.portal.repository.GeoLocationRepository;
import com.auth0.job.portal.repository.JobPostProfileRepository;

import com.auth0.job.portal.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class JobPostService {


    private final JobPostProfileRepository jobPostProfileRepository;
    private final UserRepository userRepository;
    private final GeoLocationRepository geoLocationRepository;


//    private  final JobReviewsRepository jobReviewsRepository;

    //create
    public JobProfileResponse postJob(JobProfileRequest jobProfileRequest,UUID userId) throws JobFinderBaseException {
        UserDto userDto = userRepository.findUserById(userId);
        JobPostProfileEntity jobPostProfileEntity=
                JobPostProfileConverter.postRequestToEntity(jobProfileRequest,userId);
        jobPostProfileEntity.setApplicants(0);
        jobPostProfileEntity.setStatus(true);
        jobPostProfileEntity.setIsDeleted(false);
        jobPostProfileRepository.saveJob(jobPostProfileEntity);
        geoLocationRepository.saveLoc(GeoLocationEntity.builder()
                .latitude(jobPostProfileEntity.getLat())
                .longitude(jobPostProfileEntity.getLng())
                .objectID(jobPostProfileEntity.getId())
                .objectType(TypesEnum.JOB)
                .build());

        return JobPostProfileConverter.createResponseFromEntity(jobPostProfileEntity,UserConverter.toUserEntity(userDto));

    }

    //retrieve
    public JobPostResponse getJobById(UUID id,UUID userId){
        UserDto userDto = userRepository.findUserById(userId);
        return JobPostProfileConverter.createPostResponseFromEntity(
                jobPostProfileRepository.findById(id).orElseThrow(()-> new InvalidJobIdException(id)),UserConverter.toUserEntity(userDto));

    }


    public ClubbedJobProfileResponse getJobByJobPoster(UUID userId){
        UserDto userDto= userRepository.findUserById(userId);
        List<JobProfileResponse> jobProfiles=new LinkedList<>();
        List<JobPostProfileEntity> cur=jobPostProfileRepository.findByUserId(userId);
        cur.forEach((a)->{
            jobProfiles.add(JobPostProfileConverter.createResponseFromEntity(a,UserConverter.toUserEntity(userDto)));
        });

        return ClubbedJobProfileResponse.builder()
                .jobProfileResponses(jobProfiles)
                .build();
    }

    public ClubbedJobProfileResponse getJobByIdsMatchingJobType(List<UUID> ids,UUID userId,String jobType){
        UserDto userDto= userRepository.findUserById(userId);
        List<JobProfileResponse> jobProfiles=new LinkedList<>();
        List<JobPostProfileEntity> cur=jobPostProfileRepository.findByIdIn(ids);

        cur.forEach((a)->{
            if(a.getJobType().toLowerCase().indexOf(jobType.toLowerCase())!=-1 ||
                    a.getJobDescription().toLowerCase().indexOf(jobType.toLowerCase())!=-1)
            jobProfiles.add(JobPostProfileConverter.createResponseFromEntity(a,UserConverter.toUserEntity(userDto)));
        });
        return ClubbedJobProfileResponse.builder().jobProfileResponses(jobProfiles).build();
    }
//
//    public void getJobReviews(UUID jobId){
//
//    }



    //update
//    public void updateJobById(JobProfileRequest jobProfileRequest,UUID userId){
//        jobPostProfileRepository.saveJob(JobPostProfileConverter.createJobDtoToToEntity(jobPostProfileDto));
//    }
//
//    public void updateReviews(JobReviewsDto jobReviewsDto){
//        jobReviewsRepository.saveJob(JobReviewsConverter.reviewsDtoToEntity(jobReviewsDto));
//    }
//
//    //delete
//
//    public void deleteByJobId(UUID jobId){
//        jobPostProfileRepository.deleteByJobiId(jobId);
//    }
//


}