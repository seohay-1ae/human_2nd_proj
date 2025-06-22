package com.project.travelquest.avatar.service;

import com.project.travelquest.avatar.mapper.AvatarMapper;
import com.project.travelquest.avatar.vo.AvatarPresetVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MyAvatarService {

    private final AvatarMapper avatarMapper;

    public MyAvatarService(AvatarMapper avatarMapper) {
        this.avatarMapper = avatarMapper;
    }

    public Map<String, String> getAvatarPathsByEmail(String userEmail) {
        return avatarMapper.getAvatarPathsByEmail(userEmail);
    }

    public void saveAvatarPreset(String userEmail, Map<String, String> avatarData) {
        AvatarPresetVO preset = new AvatarPresetVO();
        preset.setUserEmail(userEmail);
        preset.setHatsId(avatarData.get("hats"));
        preset.setTopsId(avatarData.get("tops"));
        preset.setBottomsId(avatarData.get("bottoms"));
        preset.setHandsId(avatarData.get("hands"));
        preset.setSkinsId(avatarData.get("skins"));
        System.out.println("hatsId: " + preset.getHatsId());
        System.out.println("topsId: " + preset.getTopsId());
        System.out.println("bottomsId: " + preset.getBottomsId());
        System.out.println("handsId: " + preset.getHandsId());
        System.out.println("skinsId: " + preset.getSkinsId());


        avatarMapper.insertOrUpdateAvatarPreset(preset);
    }
}