package com.auth0.job.portal.util;

import static com.auth0.job.portal.constants.ApplicationConstants.TEMP_DIR;
import static java.lang.String.valueOf;
import static java.lang.System.currentTimeMillis;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.auth0.job.portal.config.PropertyConfig;
import java.io.File;
import java.io.IOException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@RequiredArgsConstructor
public class ApplicationUtils {

  private final AmazonS3 amazonS3;
  private final PropertyConfig propertyConfig;

  private File convertMultiPartToFile(
      MultipartFile multipart, String fileName) throws IOException {

    File file = new File(System.getProperty(TEMP_DIR) + "/" + fileName);
    multipart.transferTo(file);
    return file;
  }

  public String uploadFile(MultipartFile multipartFile) throws IOException {

    String fileName = valueOf(currentTimeMillis()) + extractFileType(multipartFile);
    File file = convertMultiPartToFile(multipartFile, fileName);
    String fileUrl = generateFileUrl(fileName);
    uploadFileTos3bucket(propertyConfig.getImagePath() + fileName, file);
    file.delete();
    return fileUrl;
  }

  private String extractFileType(MultipartFile multipartFile) {
    return "." + multipartFile.getContentType().split("/")[1];
  }

  private String generateFileUrl(String fileName) {
    return propertyConfig.getEndpointUrl() + "/" + propertyConfig.getBucketName() + "/"
        + propertyConfig.getImagePath() + fileName;
  }

  private void uploadFileTos3bucket(String fileName, File file) {
    amazonS3.putObject(new PutObjectRequest(propertyConfig.getBucketName(), fileName, file)
        .withCannedAcl(CannedAccessControlList.PublicRead));
  }

}
