package com.medfileupload.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.medfileupload.repository.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class DatabaseOperations {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void queryUsers() {
        System.out.println("Query employees");
        String sql = "SELECT * FROM USERS";
        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
        for (Map<String, Object> row : list) {
            System.out.println(row.get("id"));
        }
    }

    public void insertUser(final User user) throws SQLException {
        System.out.println("Insert user " + user);
        String sql = "INSERT into users(username, first_name, last_name, address, zip, state) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(
                sql,
                new Object[] { user.getId(), user.getUsername(),
                        user.getFirst_name() });
    }
}
