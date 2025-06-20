package com.project.travelquest.map.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class RegionCodeService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

//    public List<PlaceItem> getPlaceItems(String region, String subregion)

    // region명 → areacode 조회 (예: "chungnam" → 34)
    public Integer getAreacodeByRegionName(String region) {
        String sql = "SELECT areacode FROM tb_areacode WHERE areaname = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{region}, Integer.class);
        } catch (Exception e) {
            // 조회 실패 시 null 반환 (혹은 로깅 추가 가능)
            return null;
        }
    }

    public Integer getSigungucodeBySubregionName(String subregion) {
        String sql = "SELECT sigungucode FROM tb_sigungu WHERE sigunguname = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{subregion}, Integer.class);
        } catch (Exception e) {
            // 조회 실패 시 null 반환 (혹은 로깅 추가 가능)
            return null;
        }
    }
};
