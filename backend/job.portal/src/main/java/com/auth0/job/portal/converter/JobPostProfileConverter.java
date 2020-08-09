package com.auth0.job.portal.converter;

import com.auth0.job.portal.entity.AddressEntity;
import com.auth0.job.portal.entity.JobPostProfileEntity;
import com.auth0.job.portal.enums.WageTimingUnits;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.request.JobProfileRequest;
import com.auth0.job.portal.model.response.JobProfileResponse;
import com.vladmihalcea.hibernate.type.range.Range;

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
        return JobPostProfileEntity.builder()
                .jobType(jobProfileRequest.getJobType())
                .jobDescription(jobProfileRequest.getJobDescriptions())
                .address(addressEntity)
                .wageTiming(Enum.valueOf(WageTimingUnits.class,jobProfileRequest.getWageTiming().toUpperCase()))
                .wages(Range.closed(jobProfileRequest.getWageLowLimit(),jobProfileRequest.getWageHighLimit()))
                .gender(jobProfileRequest.getGender())
                .imagePath(jobProfileRequest.getImagePath())
                .userId(userId)
                .build();
    }

    public static JobProfileResponse createResponseFromEntity(JobPostProfileEntity jobPostProfileEntity,String userName){

        return JobProfileResponse.builder()
                .jobId(jobPostProfileEntity.getId())
                .jobType(jobPostProfileEntity.getJobType())
                .jobDescription(jobPostProfileEntity.getJobDescription())
                .postedBy(userName)
                .wageTiming(jobPostProfileEntity.getWageTiming().toString())
                .wageLowLimit(jobPostProfileEntity.getWages().lower())
                .wageHighLimit(jobPostProfileEntity.getWages().upper())
                .build();
    }

    public static JobPostResponse createPostResponseFromEntity(JobPostProfileEntity jobPostProfileEntity,String userName){
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
                .build();
    }

}
