package com.example.v3.service;

import com.example.v3.pojo.Booking;
import com.example.v3.pojo.CourtStats;

import java.util.List;

public interface BookingService {
    
//    创建预约
    boolean createBooking(Booking booking);

//    根据用户ID查询预约
    List<Booking> findByUserId(Integer userId);

//    查询所有预约
    List<Booking> findAll();

//    根据ID查询预约
    Booking findById(Integer id);
    
//    取消预约
    boolean cancelBooking(Integer id);
    
//    确认预约
    boolean confirmBooking(Integer id);
    
//    删除预约
    boolean deleteById(Integer id);
    
//    检查预约冲突
    boolean checkConflict(Integer courtId, String bookingDate, String timeSlot);
    
//    检查预约冲突（排除指定预约）
    boolean checkConflictExcludeSelf(Integer courtId, String bookingDate, String timeSlot, Integer excludeId);
    
//    更新预约
    boolean updateBooking(Booking booking);
    
//     根据条件查询预约
    List<Booking> findByCondition(Integer userId, Integer courtId, String bookingDate, String timeSlot, String status, String studentName);
    
//    获取场地预约统计
    List<CourtStats> getCourtStats();
    
//  获取今日预约数
    int getTodayBookings();
    
//   获取本周预约数
    int getWeekBookings();
    
//    获取本月预约数
    int getMonthBookings();
} 