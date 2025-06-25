package com.project.travelquest.comu.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.util.Date;

/**
 * 댓글 VO
 * - JSON 직렬화 시 createdAt은 "yyyy-MM-dd HH:mm:ss" 형식으로 변환됨
 * - DB 저장 후 Ajax 응답 시 자동 포맷 적용
 */
@Data
public class ComuCommentVO {
    private int commentId;     // 댓글 ID (PK)
    private int postId;        // 게시글 ID (FK)
    private String writer;     // 작성자
    private String content;    // 내용

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date createdAt;    // 작성 시간
}
