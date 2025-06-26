package com.example.v3.mapper;

import com.example.v3.pojo.Anomaly;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AnomalyMapper {
    
    /**
     * 查询所有异常申报（关联查询用户和场地信息）
     */
    List<Anomaly> findAllWithDetails();
    
    /**
     * 根据用户ID查询异常申报
     */
    List<Anomaly> findByUserId(Integer userId);
    
    /**
     * 根据ID查询异常申报
     */
    Anomaly findById(Integer id);
    
    /**
     * 插入新异常申报
     */
    int insert(Anomaly anomaly);
    
    /**
     * 更新异常申报状态
     */
    int updateStatus(@Param("id") Integer id, 
                    @Param("status") String status, 
                    @Param("adminResponse") String adminResponse);
    
    /**
     * 删除异常申报
     */
    int deleteById(Integer id);
    
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
    List<Anomaly> findByCondition(@Param("courtId") Integer courtId, 
                                 @Param("status") String status);
} 