package com.example.v3.pojo;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Booking {
    private Integer id;
    private Integer userId;
    private Integer courtId;
    private LocalDate bookingDate;
    private String timeSlot;
    private String status;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    
    // 关联查询字段
    private String username;
    private String realName;
    private String courtName;
    private String courtNumber;

    public Booking() {}

    public Booking(Integer userId, Integer courtId, LocalDate bookingDate, String timeSlot) {
        this.userId = userId;
        this.courtId = courtId;
        this.bookingDate = bookingDate;
        this.timeSlot = timeSlot;
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

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
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
        return "Booking{" +
                "id=" + id +
                ", userId=" + userId +
                ", courtId=" + courtId +
                ", bookingDate=" + bookingDate +
                ", timeSlot='" + timeSlot + '\'' +
                ", status='" + status + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", username='" + username + '\'' +
                ", realName='" + realName + '\'' +
                ", courtName='" + courtName + '\'' +
                ", courtNumber='" + courtNumber + '\'' +
                '}';
    }
} 