package com.project.travelquest.map.mapper;

import com.project.travelquest.map.dto.PlaceDetail;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;

@Repository
public class PlaceDetailMapper {
    private final DataSource dataSource;

    public PlaceDetailMapper(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public PlaceDetail findByContentId(Long contentId) throws SQLException {
        String sql = "SELECT * FROM tb_tourplace WHERE contentid = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, contentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    PlaceDetail tp = new PlaceDetail();
                    tp.setContentId(rs.getLong("contentid"));
                    tp.setAddr1(rs.getString("addr1"));
                    tp.setAddr2(rs.getString("addr2"));
                    tp.setCreatedTime(rs.getString("createdtime"));
                    tp.setFirstImage(rs.getString("firstimage"));
                    tp.setFirstImage2(rs.getString("firstimage2"));
                    tp.setModifiedTime(rs.getString("modifiedtime"));
                    tp.setTel(rs.getString("tel"));
                    tp.setTitle(rs.getString("title"));
                    tp.setHomepage(rs.getString("homepage"));
                    tp.setOverview(rs.getString("overview"));
                    tp.setInfoCenter(rs.getString("infocenter"));
                    tp.setRestDate(rs.getString("restdate"));
                    tp.setUseTime(rs.getString("usetime"));
                    tp.setUseFee(rs.getString("usefee"));
                    return tp;
                } else {
                    return null;
                }
            }
        }
    }
}
