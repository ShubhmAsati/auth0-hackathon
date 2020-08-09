package com.auth0.job.portal.controller;

import com.auth0.job.portal.model.response.ImageResponse;
import com.auth0.job.portal.model.response.JobPortalResponse;
import com.auth0.job.portal.model.response.JobTypeResponse;
import com.auth0.job.portal.service.ImageService;
import com.auth0.job.portal.util.ApplicationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping("/images/v1")
public class ImageController {

  private final ImageService imageService;

  @PostMapping("/upload-image")
  public ResponseEntity<ImageResponse> uploadImage(@RequestPart(value = "image") MultipartFile image) {
    return ResponseEntity.ok(ImageResponse.builder().imageUrl(imageService.uploadImage(image)).build());
  }

  @GetMapping("/get-job-types")
  public ResponseEntity<JobTypeResponse> getJobTypes(){
    return ResponseEntity.ok(JobTypeResponse.builder().jobTypes(imageService.getJobTypes()).build());
  }

}
