package com.auth0.job.portal.service;

import com.auth0.job.portal.converter.JobPostProfileConverter;

import com.auth0.job.portal.converter.UserConverter;
import com.auth0.job.portal.entity.JobPostProfileEntity;
import com.auth0.job.portal.exception.jobs.InvalidJobIdException;
import com.auth0.job.portal.exception.jobs.JobFinderBaseException;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.UserDto;
import com.auth0.job.portal.model.request.JobProfileRequest;

import com.auth0.job.portal.model.response.ClubbedJobProfileResponse;
import com.auth0.job.portal.model.response.JobProfileResponse;
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


//    public ClubbedJobProfileResponse getJobByJobPosterAtPage(UUID userId,int page){
//        UserDetailsDto userDetailsDto= userRepository.findUserById(userId).getUserDetailsDto();
//        List<JobProfileResponse> jobProfiles=new LinkedList<>();
//        List<JobPostProfileEntity> cur=jobPostProfileRepository.findByUserId(userId);
//        cur.forEach((a)->{
//            jobProfiles.add(JobPostProfileConverter.createResponseFromEntity(a));
//        });
//
//        return ClubbedJobProfileResponse.builder()
//                .jobProfileResponses(jobProfiles)
//                .build();
//    }

    public ClubbedJobProfileResponse getJobByIds(List<UUID> ids,UUID userId){
        UserDto userDto= userRepository.findUserById(userId);
        List<JobProfileResponse> jobProfiles=new LinkedList<>();
        List<JobPostProfileEntity> cur=jobPostProfileRepository.findByIdIn(ids);
        cur.forEach((a)->{
            jobProfiles.add(JobPostProfileConverter.createResponseFromEntity(a,UserConverter.toUserEntity(userDto)));
        });
        return ClubbedJobProfileResponse.builder().jobProfileResponses(jobProfiles).build();
    }
//
//    public void getJobReviews(UUID jobId){
//
//    }



//    public JobPostProfiles getJobByLocation(UUID userId,int radius){
//
//
//
//
//
//
//        List<JobPostProfileDto> jobProfiles=new LinkedList<>();
//        jobPostProfileRepository.findByUserIdBetweenLocation(userId,0).forEach((a)->{
//            jobProfiles.add(jobPostProfileConverter.createJobEntityToToDto(a));
//        });
//        List<JobPostProfileDto> jobProfilesNext=new LinkedList<>();
//        jobPostProfileRepository.findByUserIdBetweenLocation(userId,1).forEach((a)->{
//            jobProfiles.add(jobPostProfileConverter.createJobEntityToToDto(a));
//        });
//
//        return new JobPostProfiles(jobProfiles,jobProfilesNext,null);
//    }

//    //update
//    public void updateJobById(JobPostProfileDto jobPostProfileDto){
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