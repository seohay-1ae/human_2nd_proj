package com.project.travelquest.avatar.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AvatarMapper {
    Map<String, String> selectAvatarPathsByEmail(@Param("user_email") String email);
}

