package com.project.travelquest.user.dao;

import com.project.travelquest.user.vo.UserVO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface SUserDAO {
    // 이메일 중복 검사 (파라미터 이름 명시적으로 지정)
    int existsByEmail(@Param("user_email") String user_email);

    // 회원 저장
    void saveUser(UserVO user);

    // 이메일 찾기

    @Select("SELECT * FROM tb_user WHERE user_name = #{user_name}")
    @Results(id = "UserResultMap", value = {
            @Result(column = "USER_NAME", property = "user_name"),
            @Result(column = "USER_EMAIL", property = "user_email"),
            @Result(column = "USER_PASSWORD", property = "user_password"),
            // 필요한 컬럼만 추가
            // MyBatis는 기본적으로 camelCase ↔ snake_case 변환을 안 해줍니다.(수동 매핑)
    })

    UserVO findByUsername(@Param("user_name") String user_name);
}