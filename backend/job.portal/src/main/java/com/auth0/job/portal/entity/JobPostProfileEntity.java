package com.auth0.job.portal.entity;

import com.auth0.job.portal.enums.WageTimingUnits;
import com.vladmihalcea.hibernate.type.range.Range;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.UUID;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "JOB_POST_PROFILE")
public class JobPostProfileEntity extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;


    private UUID userId;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "ADDRESS_ID", referencedColumnName = "ID")
    private AddressEntity address;

    @Column(name = "JOB_DESC")
    private String jobDescription;

    @Column(name = "JOB_TYPE")
    private String jobType;

//    @Column(name = "WORKING_HOURS")
//    private Range<Integer> workingHours;

    @Enumerated(EnumType.STRING)
    @Column(name = "WAGE_TIMING")
    private WageTimingUnits wageTiming;

    @Column(name = "IS_DELETED")
    private Boolean isDeleted;

    private Range<Integer> wages;

    private Double lat;

    private Double lng;

    private Boolean status;

    private Integer applicants;

    private String gender;

    @Column(name = "IMAGE_PATH")
    private String imagePath;

    @Column(name = "ALTERNATE_MOBILE_NUMBER")
    private String alternateMobileNumber;

    @Column(name = "CONTACT_PERSON")
    private String contactPerson;

}
