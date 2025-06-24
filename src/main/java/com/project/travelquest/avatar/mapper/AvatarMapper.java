package com.project.travelquest.avatar.mapper;

import java.util.Map;
import com.project.travelquest.avatar.vo.AvatarVO;
import com.project.travelquest.avatar.vo.AvatarPresetVO;
import com.project.travelquest.comu.vo.ComuVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface AvatarMapper {
    Map<String, String> getAvatarPathsByEmail(@Param("userEmail") String userEmail);
    List<ComuVO> getAvatarPathsByUserName(@Param("userName") String writer);  // 🔥 추가
    void insertOrUpdateAvatarPreset(AvatarPresetVO preset);
    List<AvatarVO> getItemsByType(@Param("avatar_item_type") String avatar_item_type);
    Map<String, String> getAvatarPathsByPostId(@Param("postId") int postId);

}