package com.example.v3.mapper;

import com.example.v3.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    
    /**
     * 根据用户名查询用户
     */
    User findByUsername(String username);
    
    /**
     * 用户登录验证
     */
    User login(@Param("username") String username, @Param("password") String password);
    
    /**
     * 根据用户名和角色查询用户
     */
    User findByUsernameAndRole(@Param("username") String username, @Param("role") String role);
    
    /**
     * 插入新用户
     */
    int insert(User user);
    
    /**
     * 更新用户信息
     */
    int update(User user);
    
    /**
     * 根据ID查询用户
     */
    User findById(Integer id);
    
    /**
     * 查询所有用户
     */
    List<User> findAll();
    
    /**
     * 根据角色查询用户
     */
    List<User> findByRole(String role);
    
    /**
     * 删除用户
     */
    int deleteById(Integer id);
} 