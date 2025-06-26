package com.example.v3.controller;

import com.example.v3.pojo.Announcement;
import com.example.v3.pojo.Booking;
import com.example.v3.pojo.Court;
import com.example.v3.pojo.Anomaly;
import com.example.v3.pojo.User;
import com.example.v3.pojo.CourtStats;
import com.example.v3.service.AnnouncementService;
import com.example.v3.service.BookingService;
import com.example.v3.service.CourtService;
import com.example.v3.service.AnomalyService;
import com.example.v3.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AnnouncementService announcementService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private CourtService courtService;
    @Autowired
    private AnomalyService anomalyService;
    @Autowired
    private UserService userService;

    // 管理员首页
    @GetMapping("/dashboard")
    public String dashboard() {
        return "admin/admin_dashboard";
    }

    // 公告管理列表
    @GetMapping("/announcements")
    public String announcementList(Model model) {
        List<Announcement> list = announcementService.findAll();
        model.addAttribute("announcements", list);
        return "admin/admin_list_announcements";
    }

    // 跳转到发布公告页面
    @GetMapping("/addAnnouncement")
    public String addAnnouncementPage() {
        return "admin/add_announcement";
    }

    // 发布公告
    @PostMapping("/addAnnouncement")
    public String addAnnouncement(@RequestParam("title") String title,
                                  @RequestParam("content") String content,
                                  @SessionAttribute("user") User admin) {
        Announcement announcement = new Announcement(title, content, admin.getId());
        announcement.setStatus("active");
        announcementService.createAnnouncement(announcement);
        return "redirect:/admin/announcements";
    }

    // 编辑公告页面
    @GetMapping("/editAnnouncement/{id}")
    public String editAnnouncementPage(@PathVariable Integer id, Model model) {
        Announcement announcement = announcementService.findById(id);
        model.addAttribute("announcement", announcement);
        return "admin/edit_announcement";
    }

    // 编辑公告提交
    @PostMapping("/editAnnouncement")
    public String editAnnouncement(@RequestParam("id") Integer id,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content) {
        Announcement announcement = announcementService.findById(id);
        announcement.setTitle(title);
        announcement.setContent(content);
        announcementService.updateAnnouncement(announcement);
        return "redirect:/admin/announcements";
    }

    // 删除公告
    @PostMapping("/deleteAnnouncement")
    public String deleteAnnouncement(@RequestParam("id") Integer id) {
        announcementService.deleteById(id);
        return "redirect:/admin/announcements";
    }

    // 预约管理
    @GetMapping("/bookings")
    public String bookingList(Model model,
                             @RequestParam(required = false) String studentName,
                             @RequestParam(required = false) Integer courtId,
                             @RequestParam(required = false) String timeSlot,
                             @RequestParam(required = false) String bookingDate) {
        List<Booking> bookings = bookingService.findByCondition(null, courtId, bookingDate, timeSlot, null, studentName);
        List<Court> courts = courtService.findAll();
        model.addAttribute("bookings", bookings);
        model.addAttribute("courts", courts);
        return "admin/admin_list_bookings";
    }

    // 场地预约统计
    @GetMapping("/courts")
    public String courtStats(Model model) {
        // 获取所有场地的预约统计信息
        List<Court> courts = courtService.findAll();
        List<CourtStats> courtStats = bookingService.getCourtStats();
        
        // 计算今日、本周、本月预约数
        int todayBookings = bookingService.getTodayBookings();
        int weekBookings = bookingService.getWeekBookings();
        int monthBookings = bookingService.getMonthBookings();
        
        model.addAttribute("courts", courts);
        model.addAttribute("courtStats", courtStats);
        model.addAttribute("todayBookings", todayBookings);
        model.addAttribute("weekBookings", weekBookings);
        model.addAttribute("monthBookings", monthBookings);
        return "admin/court_stats";
    }

    // 新增场地
    @PostMapping("/addCourt")
    public String addCourt(@RequestParam("courtName") String courtName,
                           @RequestParam("description") String description) {
        Court court = new Court(courtName, description, "available");
        courtService.createCourt(court);
        return "redirect:/admin/courts";
    }

    // 修改场地
    @PostMapping("/editCourt")
    public String editCourt(@RequestParam("id") Integer id,
                            @RequestParam("courtName") String courtName,
                            @RequestParam("description") String description,
                            @RequestParam("status") String status) {
        Court court = courtService.findById(id);
        court.setCourtName(courtName);
        court.setDescription(description);
        court.setStatus(status);
        courtService.updateCourt(court);
        return "redirect:/admin/courts";
    }

    // 删除场地
    @PostMapping("/deleteCourt")
    public String deleteCourt(@RequestParam("id") Integer id) {
        courtService.deleteById(id);
        return "redirect:/admin/courts";
    }

    // 异常申报管理
    @GetMapping("/anomalies")
    public String anomalyList(Model model,
                             @RequestParam(required = false) Integer courtId,
                             @RequestParam(required = false) String status) {
        List<Anomaly> anomalies = anomalyService.findByCondition(courtId, status);
        List<Court> courts = courtService.findAll();
        model.addAttribute("anomalies", anomalies);
        model.addAttribute("courts", courts);
        model.addAttribute("courtId", courtId);
        model.addAttribute("status", status);
        return "admin/admin_list_anomalies";
    }

    // 修改异常申报状态
    @PostMapping("/updateAnomalyStatus")
    public String updateAnomalyStatus(@RequestParam("id") Integer id,
                                      @RequestParam("status") String status,
                                      @RequestParam(value = "adminResponse", required = false) String adminResponse) {
        anomalyService.updateStatus(id, status, adminResponse);
        return "redirect:/admin/anomalies";
    }

    // 跳转到编辑预约页面
    @GetMapping("/editBooking/{id}")
    public String editBookingPage(@PathVariable Integer id, Model model) {
        Booking booking = bookingService.findById(id);
        List<Court> courts = courtService.findAll();
        model.addAttribute("booking", booking);
        model.addAttribute("courts", courts);
        model.addAttribute("today", java.time.LocalDate.now());
        return "admin/edit_booking";
    }

    // 更新预约
    @PostMapping("/updateBooking")
    public String updateBooking(@RequestParam("id") Integer id,
                               @RequestParam("courtId") Integer courtId,
                               @RequestParam("bookingDate") String bookingDate,
                               @RequestParam("timeSlot") String timeSlot,
                               Model model) {
        Booking booking = bookingService.findById(id);
        
        // 检查时间冲突（排除当前预约）
        if (bookingService.checkConflictExcludeSelf(courtId, bookingDate, timeSlot, id)) {
            model.addAttribute("msg", "该场地该时段已被预约");
            return "redirect:/admin/editBooking/" + id;
        }
        
        booking.setCourtId(courtId);
        booking.setBookingDate(java.time.LocalDate.parse(bookingDate));
        booking.setTimeSlot(timeSlot);
        bookingService.updateBooking(booking);
        return "redirect:/admin/bookings";
    }

    // 删除预约
    @PostMapping("/deleteBooking")
    public String deleteBooking(@RequestParam Integer id) {
        bookingService.deleteById(id);
        return "redirect:/admin/bookings";
    }

    // 直接解决异常申报
    @PostMapping("/resolveAnomaly")
    public String resolveAnomaly(@RequestParam("id") Integer id) {
        anomalyService.updateStatus(id, "resolved", "问题已解决");
        return "redirect:/admin/anomalies";
    }

    // 用户管理列表
    @GetMapping("/users")
    public String userList(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "admin/admin_list_users";
    }

    // 跳转到添加用户页面
    @GetMapping("/addUser")
    public String addUserPage() {
        return "admin/add_user";
    }

    // 添加用户
    @PostMapping("/addUser")
    public String addUser(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          @RequestParam("realName") String realName,
                          @RequestParam("role") String role,
                          Model model) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setRole(role);
        if (!userService.createUser(user)) {
            model.addAttribute("msg", "用户名已存在");
            return "admin/add_user";
        }
        return "redirect:/admin/users";
    }

    // 编辑用户页面
    @GetMapping("/editUser/{id}")
    public String editUserPage(@PathVariable Integer id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "admin/edit_user";
    }

    // 编辑用户提交
    @PostMapping("/editUser")
    public String editUser(@RequestParam("id") Integer id,
                           @RequestParam("username") String username,
                           @RequestParam("realName") String realName,
                           @RequestParam("role") String role) {
        User user = userService.findById(id);
        user.setUsername(username);
        user.setRealName(realName);
        user.setRole(role);
        userService.updateUser(user);
        return "redirect:/admin/users";
    }

    // 删除用户
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Integer id) {
        userService.deleteById(id);
        return "redirect:/admin/users";
    }
} 