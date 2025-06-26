package com.example.v3.pojo;

import java.time.LocalDateTime;

public class Anomaly {
    private Integer id;
    private Integer userId;
    private Integer courtId;
    private String description;
    private String status;
    private String adminResponse;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    
    // 关联查询字段
    private String username;
    private String realName;
    private String courtName;
    private String courtNumber;

    public Anomaly() {}

    public Anomaly(Integer userId, Integer courtId, String description) {
        this.userId = userId;
        this.courtId = courtId;
        this.description = description;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCourtId() {
        return courtId;
    }

    public void setCourtId(Integer courtId) {
        this.courtId = courtId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAdminResponse() {
        return adminResponse;
    }

    public void setAdminResponse(String adminResponse) {
        this.adminResponse = adminResponse;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getCourtName() {
        return courtName;
    }

    public void setCourtName(String courtName) {
        this.courtName = courtName;
    }

    public String getCourtNumber() {
        return courtNumber;
    }

    public void setCourtNumber(String courtNumber) {
        this.courtNumber = courtNumber;
    }

    @Override
    public String toString() {
        return "Anomaly{" +
                "id=" + id +
                ", userId=" + userId +
                ", courtId=" + courtId +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", adminResponse='" + adminResponse + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", username='" + username + '\'' +
                ", realName='" + realName + '\'' +
                ", courtName='" + courtName + '\'' +
                ", courtNumber='" + courtNumber + '\'' +
                '}';
    }
} 