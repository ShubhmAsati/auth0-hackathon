package com.auth0.job.portal.service;

import com.auth0.job.portal.exception.InternalServerException;
import com.auth0.job.portal.repository.JobTypeRepository;
import com.auth0.job.portal.util.ApplicationUtils;
import java.io.IOException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
public class ImageService {

  private final ApplicationUtils utils;
  private final JobTypeRepository jobTypeRepository;

  public String uploadImage(MultipartFile file){
    try {
      return utils.uploadFile(file);
    }catch (IOException e){
      throw new InternalServerException();
    }
  }

  public List<String> getJobTypes() {
    return jobTypeRepository.getJobTypes();
  }
}
