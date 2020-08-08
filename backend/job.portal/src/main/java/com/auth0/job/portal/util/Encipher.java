package com.auth0.job.portal.util;

import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class Encipher {

  private final PasswordEncoder passwordEncoder;

  private static final String SECRET = "Hash_Code_Secret";

  public String encrypt(String password) {
    return passwordEncoder.encode(password);
  }

  public Boolean matches(String password, String encodedPassword) {
    return passwordEncoder.matches(password, encodedPassword);
  }

  public String generateUserHash(UUID userId, String mobileNumber) {
    return passwordEncoder.encode(userId.toString() + SECRET + mobileNumber);
  }


}
