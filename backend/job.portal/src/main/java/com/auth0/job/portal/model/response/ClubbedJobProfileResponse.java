package com.auth0.job.portal.model.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ClubbedJobProfileResponse {
    private List<JobProfileResponse> jobProfileResponses;
    private Integer pageNo;
    private Integer totalPages;
}
