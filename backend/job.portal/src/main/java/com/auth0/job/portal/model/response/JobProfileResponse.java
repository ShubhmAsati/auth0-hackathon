package com.auth0.job.portal.model.response;

import com.vladmihalcea.hibernate.type.range.Range;
import lombok.Builder;
import lombok.Data;

import java.util.UUID;


@Data
@Builder
public class JobProfileResponse {

    private UUID jobId;

    private String jobType;

    private String jobDescription;

    private String postedBy;

    private String wageTiming;

    private Integer wageLowLimit;

    private Integer wageHighLimit;
}
