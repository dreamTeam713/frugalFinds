package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
           stmt = connection.prepareStatement("SELECT ads.*,u.username FROM ads JOIN users u ON ads.user_id = u.id");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    public Ad findSingleAd(Long adId){
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("SELECT ads.*,u.username FROM ads JOIN users u on ads.user_id = u.id WHERE ads.id = ?");
            ps.setLong(1,adId);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e){
            throw new RuntimeException("Error retrieving user's ads",e);
        }
    }
    public List<Ad> findAdsByUser(Long userId){
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("SELECT ads.*,u.username FROM ads JOIN users u on ads.user_id = u.id WHERE user_id = ?");
            ps.setLong(1,userId);
            ResultSet rs = ps.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e){
            throw new RuntimeException("Error retrieving user's ads",e);
        }
    }
    public List<Ad> findByText(String search) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT a.*, u.username FROM ads a JOIN users u ON a.user_id = u.id WHERE title LIKE ? OR description LIKE ?");
            stmt.setString(1, "%" + search + "%");
            stmt.setString(2, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving search results.", e);
        }
    }

    @Override
    public void update(Ad ad){
        try {
            String updateQuery = "UPDATE ads SET title = ?, description = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(updateQuery);
            ps.setString(1,ad.getTitle());
            ps.setString(2,ad.getDescription());
            ps.setLong(3,ad.getId());
            ps.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Error updating ad.", e);
        }
    }
    public void delete(Long adId){
        try {
            String updateQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(updateQuery);
            ps.setLong(1,adId);
            ps.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException("Error deleting ad" , e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description,url) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4,ad.getUrl());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("url"),
            rs.getString("username")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
