package com.example.v3.service;

import com.example.v3.pojo.User;

import java.util.List;

public interface UserService {
    
    /**
     * 查询所有用户
     */
    List<User> findAll();
    
    /**
     * 根据ID查询用户
     */
    User findById(Integer id);
    
    /**
     * 根据用户名查询用户
     */
    User findByUsername(String username);
    
    /**
     * 创建用户
     */
    boolean createUser(User user);
    
    /**
     * 更新用户
     */
    boolean updateUser(User user);
    
    /**
     * 删除用户
     */
    boolean deleteById(Integer id);
    
    /**
     * 用户登录验证
     */
    User login(String username, String password);
    
    /**
     * 检查用户名是否存在
     */
    boolean isUsernameExists(String username);
} 