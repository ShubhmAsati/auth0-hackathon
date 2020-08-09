package com.auth0.job.portal.exception.jobs;

import com.auth0.job.portal.constants.ApplicationConstants;
import org.springframework.beans.factory.annotation.Value;

import java.util.UUID;

public class InvalidJobReviewCreationException extends JobFinderBaseException{

    @Value(value = ApplicationConstants.ERR_MSG_INVALID_JOB_REVIEWS_CREATION)
    static String message;

    public InvalidJobReviewCreationException(UUID id){
        super(message+id);
    }
}
