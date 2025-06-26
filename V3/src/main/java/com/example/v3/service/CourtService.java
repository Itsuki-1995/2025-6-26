package com.example.v3.service;

import com.example.v3.pojo.Court;

import java.util.List;

public interface CourtService {
    
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
     * 创建场地
     */
    boolean createCourt(Court court);
    
    /**
     * 更新场地
     */
    boolean updateCourt(Court court);
    
    /**
     * 删除场地
     */
    boolean deleteById(Integer id);
    
    /**
     * 检查场地是否可用
     */
    boolean isAvailable(Integer id);
} 