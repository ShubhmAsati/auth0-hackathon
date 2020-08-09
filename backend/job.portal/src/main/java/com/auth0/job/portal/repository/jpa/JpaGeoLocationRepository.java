package com.auth0.job.portal.repository.jpa;

import com.auth0.job.portal.entity.GeoLocationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface JpaGeoLocationRepository extends JpaRepository<GeoLocationEntity, UUID> {

    @Query(value = "SELECT * FROM JOB_PORTAL.GEO_LOCATION WHERE OBJECT_TYPE= :type AND " +
            "(LATITUDE BETWEEN :latMin AND :longMin) AND (LONGITUDE BETWEEN :latMax AND :longMax)" +
            " AND LATITUDE!= :lat AND LONGITUDE!= :lng " //+
            //"ORDER BY calculate_distance(LATITUDE,LONGITUDE,:lat,:lng)"
             , nativeQuery = true)
    List<GeoLocationEntity> getObjectsByCoordinatesAndTypePerPage
            (@Param("lat") Double latitude, @Param("lng") Double longitude, @Param("latMax") Double latMax,
             @Param("longMax") Double longMax, @Param("latMin") Double latMin, @Param("longMin") Double longMin,
             @Param("type") String type);

    @Override
    GeoLocationEntity save(GeoLocationEntity geoLocationEntity);
}


