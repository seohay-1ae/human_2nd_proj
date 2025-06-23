package com.project.travelquest.badge.model;

public class BadgeDTO {

    // badge1 테이블
    private Long badgeId;           // badge_id
    private String badgeName;       // badge_name
    private String badgeContent;    // badge_content
    private String badgeIconPath;   // badge_icon_path
    private String badgeGetMethod;  // badge_get_method
    private String badgeRarity;     // badge_rarity

    // tb_user_badge 테이블에서 join된 정보
    private String userBadgeStatus; // 0 (잠김), 1 (해금)

    // Getter / Setter
    public Long getBadgeId() {
        return badgeId;
    }

    public void setBadgeId(Long badgeId) {
        this.badgeId = badgeId;
    }

    public String getBadgeName() {
        return badgeName;
    }

    public void setBadgeName(String badgeName) {
        this.badgeName = badgeName;
    }

    public String getBadgeContent() {
        return badgeContent;
    }

    public void setBadgeContent(String badgeContent) {
        this.badgeContent = badgeContent;
    }

    public String getBadgeIconPath() {
        return badgeIconPath;
    }

    public void setBadgeIconPath(String badgeIconPath) {
        this.badgeIconPath = badgeIconPath;
    }

    public String getBadgeGetMethod() {
        return badgeGetMethod;
    }

    public void setBadgeGetMethod(String badgeGetMethod) {
        this.badgeGetMethod = badgeGetMethod;
    }

    public String getBadgeRarity() {
        return badgeRarity;
    }

    public void setBadgeRarity(String badgeRarity) {
        this.badgeRarity = badgeRarity;
    }

    public String getUserBadgeStatus() {
        return userBadgeStatus;
    }

    public void setUserBadgeStatus(String userBadgeStatus) {
        this.userBadgeStatus = userBadgeStatus;
    }

    // 선택적으로 생성자 추가 가능
    public boolean isUnlocked() {
        return "1".equals(userBadgeStatus); // 해금 여부를 boolean으로 리턴
    }
}