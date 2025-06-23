package com.project.travelquest.comu.vo;

import lombok.Data;
import java.util.Date;
import java.util.List;

@Data
public class ComuVO {

    private int postId;        // 게시글 ID
    private String content;    // 내용
    private String writer;     // 작성자(유저네임)
    private Date createdAt;
    private int heartCount;
    private int writeCount;
    private List<ComuCommentVO> comments;
    private boolean likedByUser;
    private int reportCount;

}