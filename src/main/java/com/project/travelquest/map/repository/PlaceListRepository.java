package com.project.travelquest.map.repository;

import com.project.travelquest.map.model.TourPlace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PlaceListRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<TourPlace> findByCondition(int areacode, int sigungucode, String addr1Keyword) {
        String sql = "SELECT contentid, areacode, addr1, sigungucode FROM tb_tourplace WHERE areacode = ? AND sigungucode = ?";
        List<Object> params = new ArrayList<>();
        params.add(areacode);
        params.add(sigungucode);

        if (addr1Keyword != null && !addr1Keyword.isEmpty()) {
            sql += " AND addr1 LIKE ?";
            params.add("%" + addr1Keyword + "%");
        }

        return jdbcTemplate.query(sql, params.toArray(), new TourPlaceRowMapper());
    }

    private static class TourPlaceRowMapper implements RowMapper<TourPlace> {
        @Override
        public TourPlace mapRow(ResultSet rs, int rowNum) throws SQLException {
            TourPlace tp = new TourPlace();
            tp.setContentid(rs.getLong("contentid"));
            tp.setAreacode(rs.getInt("areacode"));
            tp.setAddr1(rs.getString("addr1"));
            tp.setSigungucode(rs.getInt("sigungucode"));
            return tp;
        }
    }
}
