package com.auth0.job.portal.model.request;

import lombok.Data;

import java.util.UUID;

@Data
public class JobProfileRequest {


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
}
