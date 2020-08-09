package com.auth0.job.portal.controller;

import com.auth0.job.portal.constants.ApplicationConstants;
import com.auth0.job.portal.model.JobPostResponse;
import com.auth0.job.portal.model.request.JobProfileRequest;
import com.auth0.job.portal.model.response.JobProfileResponse;
import com.auth0.job.portal.service.JobPostService;
import com.auth0.job.portal.constants.ApplicationConstants;
import com.auth0.job.portal.model.request.JobProfileRequest;
import com.auth0.job.portal.service.JobPostService;
import com.auth0.job.portal.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.UUID;

import static org.apache.http.HttpHeaders.AUTHORIZATION;

@RestController
@RequestMapping(name= ApplicationConstants.JOBS_URL)
@RequiredArgsConstructor
public class JobPostController {


    private final JobPostService jobPostService;
    private final JwtUtil jwtUtil;

    //create
    //job
    @PostMapping("/post-job")
    public ResponseEntity<JobProfileResponse> postJob(@RequestHeader(AUTHORIZATION) String token,@Valid @RequestBody JobProfileRequest jobProfileRequest){
        return ResponseEntity.status(HttpStatus.CREATED).body(jobPostService.postJob(jobProfileRequest,UUID.fromString(jwtUtil.extractUserId(token))));
    }

    //reviews


    //retrieve
    //byID
    @GetMapping("/get-job-post")
    public ResponseEntity<JobPostResponse> getJobById(@RequestHeader(AUTHORIZATION) String token,@Valid @RequestParam("Id") UUID id){
        return ResponseEntity.status(HttpStatus.OK).body(jobPostService.getJobById(id,UUID.fromString(jwtUtil.extractUserId(token))));
    }
//
//    //by user
//    @GetMapping("/get-job-posts-by-poster")
//    public ResponseEntity<JobPostProfiles> getJobByJobPoster(@Valid @RequestParam("Id") UUID userId){
//        return ResponseEntity.status(HttpStatus.FOUND).body(jobPostService.getJobByJobPoster(userId));
//    }
//
//    @GetMapping("/get-job-posts-by-poster-at-page")
//    public ResponseEntity<JobPostProfiles> getJobByJobPoster
//            (@Valid @RequestParam("Id") UUID userId,@Valid @RequestParam("PageNo") Integer pageNo){
//        return ResponseEntity.status(HttpStatus.FOUND).body(jobPostService.getJobByJobPosterAtPage(userId,pageNo));
//    }

//    @GetMapping("/getJobPostsByLocation")
//    public ResponseEntity<JobPostProfiles> getJobByLocation
//            (@Valid @RequestParam("Id") UUID userId,@Valid @RequestParam("Radius") int radius){0

//        return ResponseEntity.status(HttpStatus.FOUND).body(jobPostService.getJobByLocation(userId,radius));
//    }


//    //reviews
//    @GetMapping("/get-job-reviews")
//    public ResponseEntity<JobReviewsDto> getJobReviews(@Valid @RequestParam("Id") UUID jobId){
//        return ResponseEntity.status(HttpStatus.FOUND).body(jobPostService.getJobReviews(jobId));
//    }
//
//    //update
//    //job
//    @PutMapping("/update-job-post")
//    public ResponseEntity<?> updateJobById(@Valid @RequestBody JobPostProfileDto jobPostProfileDto){
//        jobPostService.updateJobById(jobPostProfileDto);
//        return ResponseEntity.status(HttpStatus.OK).body(null);
//    }
//
//    //review
//    @PutMapping("/update-reviews")
//    public ResponseEntity<?>  updateReviews(JobReviewsDto jobReviewsDto){
//        jobPostService.updateReviews(jobReviewsDto);
//        return ResponseEntity.status(HttpStatus.GONE).body(null);
//    }
//
//    //delete
//    @DeleteMapping("/delete-job")
//    public ResponseEntity<?> deleteJobById(@Valid @RequestParam("Id") UUID jobId){
//        jobPostService.deleteByJobId(jobId);
//        return ResponseEntity.status(HttpStatus.GONE).body(null);
//    }
//
//

//    @GetMapping("/postJob")
//    public void postJob(){
//
//    }


}
