package com.project.travelquest.avatar.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import com.fasterxml.jackson.annotation.JsonProperty;

@Getter
@Setter
@NoArgsConstructor
public class AvatarVO {
    @JsonProperty("itemId")
    private String avatarItemId;

    @JsonProperty("itemType")
    private String avatarItemType;

    @JsonProperty("itemPath")
    private String avatarItemPath;
}
