package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.Calendar.Event;
import org.springframework.jdbc.core.RowMapper;


public class EventMapper implements RowMapper<Event> {
        public Event mapRow(ResultSet rs, int rowNum) throws SQLException {
            Event e = null;
            e = new Event(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getString(11),rs.getString(12), rs.getString(13));
            return e;
        }
}
