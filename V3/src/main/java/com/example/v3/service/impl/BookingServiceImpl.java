package com.example.v3.service.impl;

import com.example.v3.mapper.BookingMapper;
import com.example.v3.mapper.CourtMapper;
import com.example.v3.pojo.Booking;
import com.example.v3.pojo.CourtStats;
import com.example.v3.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingMapper bookingMapper;
    @Autowired
    private CourtMapper courtMapper;
    @Override
    public boolean createBooking(Booking booking) {
        return bookingMapper.insert(booking) > 0;
    }
    @Override
    public List<Booking> findByUserId(Integer userId) {
        return bookingMapper.findByUserId(userId);
    }
    @Override
    public List<Booking> findAll() {
        return bookingMapper.findAllWithDetails();
    }
    @Override
    public Booking findById(Integer id) {
        return bookingMapper.findById(id);
    }
    @Override
    public boolean cancelBooking(Integer id) {
        return bookingMapper.updateStatus(id, "cancelled") > 0;
    }
    @Override
    public boolean confirmBooking(Integer id) {
        return bookingMapper.updateStatus(id, "confirmed") > 0;
    }
    @Override
    public boolean deleteById(Integer id) {
        return bookingMapper.deleteById(id) > 0;
    }
    @Override
    public boolean checkConflict(Integer courtId, String bookingDate, String timeSlot) {
        return courtMapper.checkConflict(courtId, bookingDate, timeSlot) > 0;
    }
    @Override
    public boolean checkConflictExcludeSelf(Integer courtId, String bookingDate, String timeSlot, Integer excludeId) {
        return courtMapper.checkConflictExcludeSelf(courtId, bookingDate, timeSlot, excludeId) > 0;
    }
    @Override
    public boolean updateBooking(Booking booking) {
        return bookingMapper.update(booking) > 0;
    }
    @Override
    public List<Booking> findByCondition(Integer userId, Integer courtId, String bookingDate, String timeSlot, String status, String studentName) {
        return bookingMapper.findByCondition(userId, courtId, bookingDate, timeSlot, status, studentName);
    }
    @Override
    public List<CourtStats> getCourtStats() {
        return bookingMapper.getCourtStats();
    }
    @Override
    public int getTodayBookings() {
        return bookingMapper.getTodayBookings();
    }
    @Override
    public int getWeekBookings() {
        return bookingMapper.getWeekBookings();
    }
    @Override
    public int getMonthBookings() {
        return bookingMapper.getMonthBookings();
    }
} 