package com.example.v3.pojo;

public class CourtStats {
    private Integer courtId;
    private String timeSlot;
    private Integer count;
    private String courtName;

    public CourtStats() {}

    public CourtStats(Integer courtId, String timeSlot, Integer count) {
        this.courtId = courtId;
        this.timeSlot = timeSlot;
        this.count = count;
    }

    public CourtStats(Integer courtId, String timeSlot, Integer count, String courtName) {
        this.courtId = courtId;
        this.timeSlot = timeSlot;
        this.count = count;
        this.courtName = courtName;
    }

    // Getters and Setters
    public Integer getCourtId() {
        return courtId;
    }

    public void setCourtId(Integer courtId) {
        this.courtId = courtId;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getCourtName() {
        return courtName;
    }

    public void setCourtName(String courtName) {
        this.courtName = courtName;
    }

    @Override
    public String toString() {
        return "CourtStats{" +
                "courtId=" + courtId +
                ", timeSlot='" + timeSlot + '\'' +
                ", count=" + count +
                ", courtName='" + courtName + '\'' +
                '}';
    }
} 