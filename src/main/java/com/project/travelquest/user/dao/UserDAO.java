package com.project.travelquest.user.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

@Mapper
public interface UserDAO {

    // 로그인
    UserVO login(UserVO userVO);

    // 이메일 중복 검사
    int existsByEmail(@Param("user_email") String user_email);

    // 회원 저장
    void saveUser(UserVO userVO);

    // 회원가입 시 아바타 프리셋 생성
    void insertAvatarPreset(@Param("user_id") Long user_id);

    // 회원가입 시 기본 배지 5개 등록 (개별 파라미터)
    void insertUserBadge(@Param("user_id") Long user_id, @Param("badge_id") int badge_id);

    // 전체 유저 조회
    public List<UserVO> selectAllUsersList() throws DataAccessException;

    // 유저 프로필 소개글 수정
    void updateUserProfileText(@Param("userId") Long userId,
                               @Param("profileText") String profileText);

    // ID로 유저 정보 조회
    UserVO getUserById(Long userId);

    // 이름으로 유저 조회
    UserVO findByUsername(@Param("user_name") String user_name);
}
