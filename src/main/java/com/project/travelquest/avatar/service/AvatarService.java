package com.project.travelquest.avatar.service;

import com.project.travelquest.avatar.mapper.AvatarMapper;
import com.project.travelquest.user.vo.UserVO;
import com.project.travelquest.avatar.vo.AvatarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import java.util.Map;
@Service
public class AvatarService {

    private final AvatarMapper avatarMapper;

    public AvatarService(AvatarMapper avatarMapper) {
        this.avatarMapper = avatarMapper;
    }

    public List<AvatarVO> getItemsByType(String avatar_item_type) {
        return avatarMapper.getItemsByType(avatar_item_type);
    }
}