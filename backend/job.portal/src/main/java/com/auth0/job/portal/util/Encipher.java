package com.auth0.job.portal.util;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class Encipher {

  private final PasswordEncoder passwordEncoder;

  public String encrypt(String password) {
    return passwordEncoder.encode(password);
  }

  public Boolean matches(String password, String encodedPassword) {
    return passwordEncoder.matches(password, encodedPassword);
  }


}
