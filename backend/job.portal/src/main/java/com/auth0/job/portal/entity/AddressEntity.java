package com.auth0.job.portal.entity;

import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.auth0.job.portal.model.JobPostResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.geo.Point;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "address")
public class AddressEntity extends BaseEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private UUID id;

  private String city;

  private String state;

  private String country;

  @Column(name = "pin_code")
  private int pinCode;

  private String landmark;

  @Column(name = "address_line_1")
  private String addressLine1;

  @Column(name = "geo_location")
  private Point geoLocation;

  @OneToOne(mappedBy = "address")
  private UserDetailsEntity userDetailsEntity;

  @OneToOne(mappedBy = "address")
  private JobPostProfileEntity jobPostProfileEntity;

}
