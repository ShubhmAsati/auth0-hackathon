package com.auth0.job.portal.repository;


import com.auth0.job.portal.entity.GeoLocationEntity;
import com.auth0.job.portal.enums.TypesEnum;
import com.auth0.job.portal.repository.jpa.JpaGeoLocationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class GeoLocationRepository {

    @Autowired
    EntityManager entityManager;

    private final JpaGeoLocationRepository jpaGeoLocationRepository;

    public List<UUID> getObjectsByCoordinatesAndType(Double latitude, Double longitude, Double[] latLongs, TypesEnum type
                                                            ){

//          jpaGeoLocationRepository.getObjectsByCoordinatesAndTypePerPage
//                (latitude,longitude,latLongs[0],latLongs[1],latLongs[2],latLongs[3],type.toString());
        List<UUID> ids=new LinkedList<>();

         entityManager.createNativeQuery("SELECT * FROM JOB_PORTAL.GEO_LOCATION WHERE OBJECT_TYPE= :type AND "+
                "(LATITUDE BETWEEN :latMin AND :latMax) AND (LONGITUDE BETWEEN :longMin AND :longMax)",GeoLocationEntity.class)
         .setParameter("type",type.toString()).setParameter("latMax",latLongs[0]).setParameter("longMax",latLongs[1]).setParameter("latMin",latLongs[2])
         .setParameter("longMin",latLongs[3]).getResultList().forEach((a)->{
             GeoLocationEntity b=(GeoLocationEntity)a;
             ids.add(b.getObjectID());
                 });
//        System.out.println("|->>>>>");
//        System.out.println(ids);
//        System.out.println("|->>>>>");
        return ids;


    }

    public GeoLocationEntity saveLoc(GeoLocationEntity geoLocationEntity){
        return jpaGeoLocationRepository.save(geoLocationEntity);
    }


}

//    CREATE OR REPLACE FUNCTION calculate_distance(lat1 double precision, lon1 double precision, lat2 double precision, lon2 double precision)
//RETURNS float AS $dist$
//        DECLARE
//        dist float = 0;
//        radlat1 float;
//        radlat2 float;
//        theta float;
//        radtheta float;
//        BEGIN
//        IF lat1 = lat2 OR lon1 = lon2
//        THEN RETURN dist;
//        ELSE
//        radlat1 = pi() * lat1 / 180;
//        radlat2 = pi() * lat2 / 180;
//        theta = lon1 - lon2;
//        radtheta = pi() * theta / 180;
//        dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta);
//
//        IF dist > 1 THEN dist = 1; END IF;
//
//        dist = acos(dist);
//        dist = dist * 180 / pi();
//        dist = dist * 60 * 1.1515;
//
//        dist = dist * 1.609344;
//
//
//        RETURN dist;
//        END IF;
//        END;
//        $dist$ LANGUAGE plpgsql;
