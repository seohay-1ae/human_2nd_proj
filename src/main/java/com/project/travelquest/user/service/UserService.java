package com.project.travelquest.user.service;

import com.project.travelquest.user.dao.UserDAO;
import com.project.travelquest.user.util.PasswordValidator;
import com.project.travelquest.user.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("UserService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {

    @Autowired
    UserDAO userDAO;

    // 로그인
    public UserVO login(UserVO userVO) {
        return userDAO.login(userVO);
    }

    // 회원 목록 조회
    public List<UserVO> listUsers() throws Exception {
        return userDAO.selectAllUsersList();
    }

    // 프로필 소개글 수정
    public void updateUserProfileText(Long userId, String profileText) {
        userDAO.updateUserProfileText(userId, profileText);
    }

    // ID로 유저 조회
    public UserVO getUserById(Long userId) {
        return userDAO.getUserById(userId);
    }

    // 이름으로 유저 조회
    public UserVO getUserByUsername(String user_name) {
        return userDAO.findByUsername(user_name);
    }

    // 이메일 중복 검사
    public boolean existsByEmail(String user_email) {
        return userDAO.existsByEmail(user_email) > 0;
    }

    // 회원가입 서비스
    public String validateAndSaveUser(UserVO user) {
        // 1. 비밀번호 일치 여부 확인
        if (!PasswordValidator.isValid(user.getUser_password(), user.getPassword_check())) {
            return "비밀번호가 일치하지 않습니다.";
        }

        // 2. 이메일 중복 검사
        if (existsByEmail(user.getUser_email())) {
            return "이미 존재하는 이메일입니다.";
        }

        // 3. 회원 저장 (DB에서 생성된 user_id가 VO에 세팅됨)
        userDAO.saveUser(user);

        Long generatedUserId = user.getUser_id(); // DB가 생성한 user_id
        System.out.println("Generated user_id: " + generatedUserId);

        // 4. DB 확인 (선택)
        UserVO checkUser = userDAO.getUserById(generatedUserId);
        System.out.println("User from DB: " + (checkUser != null ? checkUser.getUser_email() : "null"));

        // 5. 아바타 프리셋 생성
        userDAO.insertAvatarPreset(generatedUserId);

        // 6. 기본 배지 5개 등록
        for (int i = 1; i <= 5; i++) {
            userDAO.insertUserBadge(generatedUserId, i);
        }

        return null; // 성공 시
    }

    // 비밀번호 업데이트
    public void updatePw(UserVO userVO) {
        userDAO.updatePw(userVO);
    }
}