package com.example.v3.pojo;

import java.time.LocalDateTime;

public class Court {
    private Integer id;
    private String courtNumber;
    private String courtName;
    private String status;
    private LocalDateTime createTime;
    private String description;

    public Court() {}

    public Court(String courtNumber, String courtName, String status) {
        this.courtNumber = courtNumber;
        this.courtName = courtName;
        this.status = status;
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourtNumber() {
        return courtNumber;
    }

    public void setCourtNumber(String courtNumber) {
        this.courtNumber = courtNumber;
    }

    public String getCourtName() {
        return courtName;
    }

    public void setCourtName(String courtName) {
        this.courtName = courtName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Court{" +
                "id=" + id +
                ", courtNumber='" + courtNumber + '\'' +
                ", courtName='" + courtName + '\'' +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                '}';
    }
} 