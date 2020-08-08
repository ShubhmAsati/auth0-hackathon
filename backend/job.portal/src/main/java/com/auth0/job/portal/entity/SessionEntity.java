package com.auth0.job.portal.entity;

import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "session")
public class SessionEntity extends BaseEntity{

  @Id
  @Column(name = "user_id")
  private UUID userId;

  @Column(name = "session_id", unique = true)
  private String sessionId;



}
