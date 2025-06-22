package com.project.travelquest.avatar.service;

import com.project.travelquest.avatar.mapper.AvatarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AvatarService {

    private final AvatarMapper avatarMapper;

    @Autowired
    public AvatarService(AvatarMapper avatarMapper) {
        this.avatarMapper = avatarMapper;
    }

    public Map<String, String> getAvatarPathsByEmail(String email) {
        return avatarMapper.selectAvatarPathsByEmail(email);
    }
}

