package com.auth0.job.portal.service;

import com.auth0.job.portal.converter.JobPostProfileConverter;

import com.auth0.job.portal.entity.JobPostProfileEntity;

import com.auth0.job.portal.exception.jobs.InvalidJobIdException;
import com.auth0.job.portal.exception.jobs.JobFinderBaseException;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.request.JobProfileRequest;

import com.auth0.job.portal.model.response.JobProfileResponse;
import com.auth0.job.portal.repository.JobPostProfileRepository;

import com.auth0.job.portal.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class JobPostService {


    private final JobPostProfileRepository jobPostProfileRepository;
    private final UserRepository userRepository;

//    private final AddressRepository addressRepository;
//    private  final JobReviewsRepository jobReviewsRepository;

    //private final JobPostProfileConverter jobPostProfileConverter;
    //private final JobReviewsConverter jobReviewsConverter;

    //create
    public JobProfileResponse postJob(JobProfileRequest jobProfileRequest,UUID userId) throws JobFinderBaseException {
        JobPostProfileEntity jobPostProfileEntity=
                JobPostProfileConverter.postRequestToEntity(jobProfileRequest,userId);
        jobPostProfileEntity.setApplicants(0);
        jobPostProfileEntity.setStatus(true);
        jobPostProfileEntity.setIsDeleted(false);
//        if(jobPostProfileEntity.getUser().getId()==null){
//            throw new InvalidUserException();
//        }

        jobPostProfileRepository.saveJob(jobPostProfileEntity);
        UserDetailsDto userDetailsDto= userRepository.findUserById(userId).getUserDetailsDto();
        return JobPostProfileConverter.createResponseFromEntity(jobPostProfileEntity,userDetailsDto.getFirstName()+userDetailsDto.getLastName());

    }

    //retrieve
    public JobPostResponse getJobById(UUID id,UUID userId){
        UserDetailsDto userDetailsDto= userRepository.findUserById(userId).getUserDetailsDto();
        return JobPostProfileConverter.createPostResponseFromEntity(
                jobPostProfileRepository.findById(id).orElseThrow(()-> new InvalidJobIdException(id)),userDetailsDto.getFirstName()+userDetailsDto.getLastName());

    }


    public void getJobByJobPoster(UUID userId){

    }


    public void getJobByJobPosterAtPage(UUID userId,int page){

    }

    public void getJobByIds(List<UUID> ids,int page){

    }

    public void getJobReviews(UUID jobId){

    }



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