package com.example.v3.service;

import com.example.v3.pojo.Anomaly;

import java.util.List;

public interface AnomalyService {
    
    /**
     * 查询所有异常申报
     */
    List<Anomaly> findAll();
    
    /**
     * 根据用户ID查询异常申报
     */
    List<Anomaly> findByUserId(Integer userId);
    
    /**
     * 根据ID查询异常申报
     */
    Anomaly findById(Integer id);
    
    /**
     * 创建异常申报
     */
    boolean createAnomaly(Anomaly anomaly);
    
    /**
     * 更新异常申报状态
     */
    boolean updateStatus(Integer id, String status, String adminResponse);
    
    /**
     * 删除异常申报
     */
    boolean deleteById(Integer id);
    
    /**
     * 根据状态查询异常申报
     */
    List<Anomaly> findByStatus(String status);
    
    /**
     * 根据场地ID查询异常申报
     */
    List<Anomaly> findByCourtId(Integer courtId);
    
    /**
     * 根据条件搜索异常申报
     */
    List<Anomaly> findByCondition(Integer courtId, String status);
} 