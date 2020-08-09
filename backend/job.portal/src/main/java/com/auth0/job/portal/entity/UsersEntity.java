package com.auth0.job.portal.entity;

import com.auth0.job.portal.enums.UserType;

import java.util.List;
import java.util.UUID;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "users")
public class UsersEntity extends BaseEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private UUID id;

  @Column(name = "mobile_number")
  private String mobileNumber;

  private String password;

  @Enumerated(EnumType.ORDINAL)
  @Column(name = "user_type")
  private UserType userType;

  @Column(name = "is_active")
  private Boolean isActive;

  @Column(name = "is_verified")
  private Boolean isVerified;

  @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
  @JoinColumn(name = "user_details_id", referencedColumnName = "id")
  private UserDetailsEntity userDetailsEntity;

}
