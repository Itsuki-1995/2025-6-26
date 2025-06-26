package com.example.v3.mapper;

import com.example.v3.pojo.Announcement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AnnouncementMapper {
    
    /**
     * 查询所有公告（关联查询管理员信息）
     */
    List<Announcement> findAllWithDetails();
    
    /**
     * 查询活跃的公告
     */
    List<Announcement> findActive();
    
    /**
     * 根据ID查询公告
     */
    Announcement findById(Integer id);
    
    /**
     * 插入新公告
     */
    int insert(Announcement announcement);
    
    /**
     * 更新公告
     */
    int update(Announcement announcement);
    
    /**
     * 删除公告
     */
    int deleteById(Integer id);
    
    /**
     * 更新公告状态
     */
    int updateStatus(@Param("id") Integer id, @Param("status") String status);
    
    /**
     * 根据标题搜索公告
     */
    List<Announcement> searchByTitle(String title);
} 