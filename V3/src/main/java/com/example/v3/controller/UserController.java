package com.example.v3.controller;

import com.example.v3.pojo.User;
import com.example.v3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 登录页面
    @GetMapping({"/", "/login"})
    public String loginPage() {
        return "login";
    }

    // 登录处理
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("role") String role,
                        Model model,
                        HttpSession session) {
        User user = userService.login(username, password);
        if (user != null && user.getRole().equals(role)) {
            session.setAttribute("user", user);
            if ("admin".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/student/dashboard";
            }
        } else {
            model.addAttribute("msg", "用户名或密码错误，或角色选择有误");
            return "login";
        }
    }

    // 注册页面
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // 注册处理
    @PostMapping("/register")
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("realName") String realName,
                           Model model) {
        User user = new User(username, password, realName, "student");
        if (userService.createUser(user)) {
            model.addAttribute("msg", "注册成功，请登录");
            return "login";
        } else {
            model.addAttribute("msg", "用户名已存在");
            return "register";
        }
    }

    // 退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
} 