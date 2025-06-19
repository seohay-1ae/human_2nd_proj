//영문 지역명을 한글로 매핑
package com.project.travelquest.utils;

// utils/RegionNameMapper.java
import java.util.HashMap;
import java.util.Map;

public class RegionNameMapper {
    private static final Map<String, String> regionMap = new HashMap<>();
    private static final Map<String, Map<String, String>> subregionMap = new HashMap<>();

    static {
        regionMap.put("seoul", "서울");
        regionMap.put("incheon", "인천");
        regionMap.put("daejeon", "대전");
        regionMap.put("daegu", "대구");
        regionMap.put("gwangju", "광주");
        regionMap.put("busan", "부산");
        regionMap.put("ulsan", "울산");
        regionMap.put("sejong", "세종");
        regionMap.put("gyeonggi", "경기");
        regionMap.put("gangwon", "강원");
        regionMap.put("chungbuk", "충북");
        regionMap.put("chungnam", "충남");
        regionMap.put("gyeongbuk", "경북");
        regionMap.put("gyeongnam", "경남");
        regionMap.put("jeonbuk", "전북");
        regionMap.put("jeonnam", "전남");
        regionMap.put("jeju", "제주");

        Map<String, String> chungnamSub = new HashMap<>();
        chungnamSub.put("gongju", "공주시");
        chungnamSub.put("geumsan", "금산군");
        chungnamSub.put("nonsan", "논산시");
        chungnamSub.put("dangjin", "당진시");
        chungnamSub.put("boryeong", "보령시");
        chungnamSub.put("buyeo", "부여군");
        chungnamSub.put("seosan", "서산시");
        chungnamSub.put("seocheon", "서천군");
        chungnamSub.put("asan", "아산시");
        chungnamSub.put("yesan", "예산군");
        chungnamSub.put("cheonan", "천안시");
        chungnamSub.put("chungyang", "청양군");
        chungnamSub.put("taean", "태안군");
        chungnamSub.put("hongsung", "홍성군");
        chungnamSub.put("gyeryong", "계룡시");

        Map<String, String> daejeonSub = new HashMap<>();
        daejeonSub.put("daeduck", "대덕구");
        daejeonSub.put("donggu", "동구");
        daejeonSub.put("seogu", "서구");
        daejeonSub.put("yusung", "유성구");
        daejeonSub.put("junggu", "중구");
        // 추가...

        subregionMap.put("chungnam", chungnamSub);
        subregionMap.put("daejeon", daejeonSub);
        // 추가...
    }

    /**
     * 광역시/도 한글명 반환
     */
    public static String getRegionKr(String code) {
        return regionMap.getOrDefault(code.toLowerCase(), code);
    }

    /**
     * 시/군/구 한글명 반환
     */
    public static String getSubregionKr(String regionCode, String subCode) {
        Map<String, String> subMap = subregionMap.get(regionCode.toLowerCase());
        if (subMap != null) {
            return subMap.getOrDefault(subCode.toLowerCase(), subCode);
        }
        return subCode;
    }
}

