package com.example.v3.pojo;

import java.time.LocalDateTime;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String realName;
    private String role;
    private LocalDateTime createTime;

    public User() {}

    public User(String username, String password, String realName, String role) {
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.role = role;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", role='" + role + '\'' +
                ", createTime=" + createTime +
                '}';
    }
} 