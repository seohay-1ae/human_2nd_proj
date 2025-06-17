package com.project.travelquest.member.dao;

import com.project.travelquest.member.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserRepository {
    
    @Autowired
    private DataSource dataSource;
    
    // DB에서 이메일 중복 검사 로직
    public boolean existsByEmail(String email){
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; //이메일이 1개 이상 있으면 중복true
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("DB 중복 검사 실패", e);
        }
            return false;
        }
        
        // 회원정보를 DB에 저장하는 로직
    public void saveUser(UserVO user) {
        String sql = "INSERT INTO users (email, password, username, phone_number, cert_number) VALUES (?,?,?,?,?)";

        try (
                Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getCertNumber());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("DB 저장 실패", e);
        }
        
    }
    }
