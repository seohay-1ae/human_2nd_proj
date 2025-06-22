package com.project.travelquest.avatar.mapper;

import java.util.Map;
import com.project.travelquest.avatar.vo.AvatarVO;
import com.project.travelquest.avatar.vo.AvatarPresetVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface AvatarMapper {
    Map<String, String> getAvatarPathsByEmail(@Param("userEmail") String userEmail);
    void insertOrUpdateAvatarPreset(AvatarPresetVO preset);
    List<AvatarVO> getItemsByType(@Param("avatar_item_type") String avatar_item_type);

}