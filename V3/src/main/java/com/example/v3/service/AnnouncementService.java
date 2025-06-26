package com.example.v3.service;

import com.example.v3.pojo.Announcement;

import java.util.List;

public interface AnnouncementService {
    
    /**
     * 查询所有公告
     */
    List<Announcement> findAll();
    
    /**
     * 查询活跃的公告
     */
    List<Announcement> findActive();
    
    /**
     * 根据ID查询公告
     */
    Announcement findById(Integer id);
    
    /**
     * 创建公告
     */
    boolean createAnnouncement(Announcement announcement);
    
    /**
     * 更新公告
     */
    boolean updateAnnouncement(Announcement announcement);
    
    /**
     * 删除公告
     */
    boolean deleteById(Integer id);
    
    /**
     * 更新公告状态
     */
    boolean updateStatus(Integer id, String status);
    
    /**
     * 根据标题搜索公告
     */
    List<Announcement> searchByTitle(String title);
} 