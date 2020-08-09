package com.auth0.job.portal.converter;

import com.auth0.job.portal.entity.AddressEntity;
import com.auth0.job.portal.entity.JobPostProfileEntity;
import com.auth0.job.portal.entity.UsersEntity;
import com.auth0.job.portal.enums.WageTimingUnits;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.UserDetailsDto;
import com.auth0.job.portal.model.request.JobProfileRequest;
import com.auth0.job.portal.model.response.JobProfileResponse;
import com.vladmihalcea.hibernate.type.range.Range;

import java.util.Arrays;
import java.util.UUID;

public class JobPostProfileConverter {

    public static JobPostProfileEntity postRequestToEntity(JobProfileRequest jobProfileRequest, UUID userId){
        AddressEntity addressEntity=AddressEntity.builder()
                .country(jobProfileRequest.getCountry())
                .state(jobProfileRequest.getState())
                .city(jobProfileRequest.getCity())
                .pinCode(jobProfileRequest.getPinCode())
                .addressLine1(jobProfileRequest.getAddressLine1())
                .landmark(jobProfileRequest.getLandmark())
                .build();

        JobPostProfileEntity jobPostProfileEntity= JobPostProfileEntity.builder()
                .jobType(jobProfileRequest.getJobType())
                .jobDescription(jobProfileRequest.getJobDescriptions())
                .address(addressEntity)
                .lat(jobProfileRequest.getLat())
                .lng(jobProfileRequest.getLng())
                .alternateMobileNumber(jobProfileRequest.getAlternateMobileNumber())
                .contactPerson(jobProfileRequest.getContactPerson())
                .wageTiming(Enum.valueOf(WageTimingUnits.class,jobProfileRequest.getWageTiming().toUpperCase()))
                .wages(Range.closed(jobProfileRequest.getWageLowLimit(),jobProfileRequest.getWageHighLimit()))
                .gender(jobProfileRequest.getGender())
                .imagePath(jobProfileRequest.getImagePath())
                .userId(userId)
                .build();


        return jobPostProfileEntity;
    }

    public static JobProfileResponse createResponseFromEntity(JobPostProfileEntity jobPostProfileEntity,UsersEntity usersEntity){

        return JobProfileResponse.builder()
                .jobId(jobPostProfileEntity.getId())
                .jobType(jobPostProfileEntity.getJobType())
                .jobDescription(jobPostProfileEntity.getJobDescription())
                .postedBy(usersEntity.getUserDetailsEntity().getFirstName()+" "+usersEntity.getUserDetailsEntity().getLastName())
                .wageTiming(jobPostProfileEntity.getWageTiming().toString())
                .wageLowLimit(jobPostProfileEntity.getWages().lower())
                .wageHighLimit(jobPostProfileEntity.getWages().upper())
                .build();
    }

    public static JobPostResponse createPostResponseFromEntity(JobPostProfileEntity jobPostProfileEntity,UsersEntity usersEntity){
        return JobPostResponse.builder()
                .jobId(jobPostProfileEntity.getId())
                .jobDescriptions(jobPostProfileEntity.getJobDescription())
                .jobType(jobPostProfileEntity.getJobType())
                .wageTiming(jobPostProfileEntity.getWageTiming().toString())
                .wageLowLimit(jobPostProfileEntity.getWages().lower())
                .wageHighLimit(jobPostProfileEntity.getWages().upper())
                .gender(jobPostProfileEntity.getGender())
                .imagePath(jobPostProfileEntity.getImagePath())
                .lat(jobPostProfileEntity.getLat())
                .lng(jobPostProfileEntity.getLng())
                .alternateMobileNumber(jobPostProfileEntity.getAlternateMobileNumber())
                .contactPerson(jobPostProfileEntity.getContactPerson())
                .addressLine1(jobPostProfileEntity.getAddress().getAddressLine1())
                .contactPerson(jobPostProfileEntity.getContactPerson())
                .pinCode(jobPostProfileEntity.getAddress().getPinCode())
                .city(jobPostProfileEntity.getAddress().getCity())
                .state(jobPostProfileEntity.getAddress().getState())
                .country(jobPostProfileEntity.getAddress().getCountry())
                .landmark(jobPostProfileEntity.getAddress().getLandmark())
                .addressLine1(jobPostProfileEntity.getAddress().getAddressLine1())
                .status(jobPostProfileEntity.getStatus()?"Active":"Not Active")
                .email(usersEntity.getUserDetailsEntity().getEmail())
                .firstName(usersEntity.getUserDetailsEntity().getFirstName())
                .lastName(usersEntity.getUserDetailsEntity().getLastName())
                .build();
    }

}
