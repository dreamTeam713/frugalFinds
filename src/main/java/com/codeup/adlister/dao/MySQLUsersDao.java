package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.*;

public class MySQLUsersDao implements Users{
    private Connection connection = null;

    @Override
    public User findByUsername(String username) {
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM users WHERE username =? ");
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new User(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4));
            }else{
                return null;
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user.", e);
        }
    }

    @Override
    public Long insert(User user) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO users(username, email, password) VALUES (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new user.", e);
        }
    }

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }
}
