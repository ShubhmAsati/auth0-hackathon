package com.auth0.job.portal.model;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class JobPostResponse {
    private UUID jobId;

    private String jobDescriptions;

    private String jobType;

    private String wageTiming;

    private Integer wageLowLimit;

    private Integer wageHighLimit;

    private String gender;

    private String imagePath;

    private Double lat;

    private Double lng;

    private String alternateMobileNumber;

    private String contactPerson;

    private Integer pinCode;

    private String city;

    private String state;

    private String country;

    private String landmark;

    private String addressLine1;

    private Integer applicants;

    private String status;


}
