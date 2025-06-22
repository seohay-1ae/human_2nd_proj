package com.project.travelquest.map.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.project.travelquest.map.model.Location;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LocationMapper {
    List<Location> getAllLocations();

    List<Location> getLocationsByFilter(@Param("region") String region, @Param("subregion") String subregion);

    Location getLocationById(@Param("contentid") Long contentid);

    Location getBadgeImgbyContentId(@Param("contentId") String contentid);

}
