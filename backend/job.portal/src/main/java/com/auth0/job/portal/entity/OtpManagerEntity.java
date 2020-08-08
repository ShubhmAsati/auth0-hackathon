package com.auth0.job.portal.entity;

import com.auth0.job.portal.enums.OtpType;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "otp_manager")
public class OtpManagerEntity extends BaseEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private UUID id;

  private Integer otp;
  @Column(name = "user_id", unique = true)
  private UUID userId;

  @Column(name = "resend_count")
  private Integer resendCount;

  @Column(name = "is_login_otp")
  private Boolean isLoginOTP;

  @Enumerated(EnumType.STRING)
  @Column(name = "otp_type")
  private OtpType otpType;

}
