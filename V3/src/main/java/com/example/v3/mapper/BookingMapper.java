package com.example.v3.mapper;

import com.example.v3.pojo.Booking;
import com.example.v3.pojo.CourtStats;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookingMapper {
    
    /**
     * 查询所有预约（关联查询用户和场地信息）
     */
    List<Booking> findAllWithDetails();
    
    /**
     * 根据用户ID查询预约
     */
    List<Booking> findByUserId(Integer userId);
    
    /**
     * 根据ID查询预约
     */
    Booking findById(Integer id);
    
    /**
     * 插入新预约
     */
    int insert(Booking booking);
    
    /**
     * 更新预约状态
     */
    int updateStatus(@Param("id") Integer id, @Param("status") String status);
    
    /**
     * 更新预约信息
     */
    int update(Booking booking);
    
    /**
     * 删除预约
     */
    int deleteById(Integer id);
    
    /**
     * 根据条件查询预约
     */
    List<Booking> findByCondition(@Param("userId") Integer userId,
                                 @Param("courtId") Integer courtId,
                                 @Param("bookingDate") String bookingDate,
                                 @Param("timeSlot") String timeSlot,
                                 @Param("status") String status,
                                 @Param("studentName") String studentName);
    
    /**
     * 查询指定日期和时间段的预约
     */
    List<Booking> findByDateAndTimeSlot(@Param("bookingDate") String bookingDate,
                                       @Param("timeSlot") String timeSlot);
    
    /**
     * 获取场地预约统计
     */
    List<CourtStats> getCourtStats();
    
    /**
     * 获取今日预约数
     */
    int getTodayBookings();
    
    /**
     * 获取本周预约数
     */
    int getWeekBookings();
    
    /**
     * 获取本月预约数
     */
    int getMonthBookings();
} 