package com.example.v3.mapper;

import com.example.v3.pojo.Court;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourtMapper {
    
    /**
     * 查询所有场地
     */
    List<Court> findAll();
    
    /**
     * 根据ID查询场地
     */
    Court findById(Integer id);
    
    /**
     * 根据状态查询场地
     */
    List<Court> findByStatus(String status);
    
    /**
     * 插入新场地
     */
    int insert(Court court);
    
    /**
     * 更新场地信息
     */
    int update(Court court);
    
    /**
     * 删除场地
     */
    int deleteById(Integer id);
    
    /**
     * 检查指定日期和时间段是否有冲突预约
     */
    int checkConflict(@Param("courtId") Integer courtId, 
                     @Param("bookingDate") String bookingDate, 
                     @Param("timeSlot") String timeSlot);
    
    /**
     * 检查指定日期和时间段是否有冲突预约（排除指定预约）
     */
    int checkConflictExcludeSelf(@Param("courtId") Integer courtId, 
                                @Param("bookingDate") String bookingDate, 
                                @Param("timeSlot") String timeSlot,
                                @Param("excludeId") Integer excludeId);
} 