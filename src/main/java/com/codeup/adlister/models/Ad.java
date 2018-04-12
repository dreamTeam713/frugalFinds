package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private double price;
    private String url;
    private String username;


    public void setPrice(Long price){this.price = price;}
    public double getPrice(){return price;}

    public String getUrl() { return url; }

    public void setUrl(String url) { this.url = url; }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
    }
    public Ad(long id, long userId, String title, String description, String username) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.username = username;
    }
    public Ad(long id, long userId, String title, String description,Double price ,String url, String username) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
        this.username = username;
    }

    public Ad(long userId, String title, String description,Double price, String url) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.url = url;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
