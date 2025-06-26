package com.example.v3.controller;

import com.example.v3.pojo.Booking;
import com.example.v3.pojo.Court;
import com.example.v3.pojo.Announcement;
import com.example.v3.pojo.Anomaly;
import com.example.v3.pojo.User;
import com.example.v3.service.BookingService;
import com.example.v3.service.CourtService;
import com.example.v3.service.AnnouncementService;
import com.example.v3.service.AnomalyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private CourtService courtService;
    @Autowired
    private AnnouncementService announcementService;
    @Autowired
    private AnomalyService anomalyService;

    // 学生首页
    @GetMapping("/dashboard")
    public String dashboard() {
        return "student/dashboard";
    }

    // 跳转到预约场馆页面
    @GetMapping("/book")
    public String bookPage(Model model) {
        List<Court> courts = courtService.findAll();
        model.addAttribute("courts", courts);
        model.addAttribute("today", java.time.LocalDate.now().plusDays(1));
        return "court/booking";
    }

    // 提交预约
    @PostMapping("/book")
    public String book(@RequestParam("courtId") Integer courtId,
                      @RequestParam("bookingDate") String bookingDate,
                      @RequestParam("timeSlot") String timeSlot,
                      HttpSession session,
                      Model model) {
        User user = (User) session.getAttribute("user");
        Booking booking = new Booking(user.getId(), courtId, java.time.LocalDate.parse(bookingDate), timeSlot);
        booking.setStatus("confirmed");
        if (bookingService.checkConflict(courtId, bookingDate, timeSlot)) {
            model.addAttribute("msg", "该场地该时段已被预约");
            return "court/booking";
        }
        bookingService.createBooking(booking);
        return "redirect:/student/myBooking";
    }

    // 我的预约
    @GetMapping("/myBooking")
    public String myBooking(HttpSession session, Model model,
                           @RequestParam(required = false) Integer courtId,
                           @RequestParam(required = false) String timeSlot,
                           @RequestParam(required = false) String bookingDate) {
        User user = (User) session.getAttribute("user");
        List<Booking> bookings = bookingService.findByCondition(user.getId(), courtId, bookingDate, timeSlot, null, null);
        List<Court> courts = courtService.findAll();
        model.addAttribute("bookings", bookings);
        model.addAttribute("courts", courts);
        return "court/my_booking";
    }

    // 跳转到修改预约页面
    @GetMapping("/editBooking/{id}")
    public String editBookingPage(@PathVariable Integer id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Booking booking = bookingService.findById(id);
        
        // 检查是否是当前用户的预约
        if (booking == null || !booking.getUserId().equals(user.getId())) {
            return "redirect:/student/myBooking";
        }
        
        List<Court> courts = courtService.findAll();
        model.addAttribute("booking", booking);
        model.addAttribute("courts", courts);
        model.addAttribute("today", java.time.LocalDate.now());
        return "court/edit_booking";
    }

    // 更新预约
    @PostMapping("/updateBooking")
    public String updateBooking(@RequestParam("id") Integer id,
                               @RequestParam("courtId") Integer courtId,
                               @RequestParam("bookingDate") String bookingDate,
                               @RequestParam("timeSlot") String timeSlot,
                               HttpSession session,
                               Model model) {
        User user = (User) session.getAttribute("user");
        Booking booking = bookingService.findById(id);
        
        // 检查是否是当前用户的预约
        if (booking == null || !booking.getUserId().equals(user.getId())) {
            return "redirect:/student/myBooking";
        }
        
        // 检查时间冲突（排除当前预约）
        if (bookingService.checkConflictExcludeSelf(courtId, bookingDate, timeSlot, id)) {
            model.addAttribute("msg", "该场地该时段已被预约");
            return "redirect:/student/editBooking/" + id;
        }
        
        booking.setCourtId(courtId);
        booking.setBookingDate(java.time.LocalDate.parse(bookingDate));
        booking.setTimeSlot(timeSlot);
        bookingService.updateBooking(booking);
        return "redirect:/student/myBooking";
    }

    // 删除预约
    @PostMapping("/deleteBooking")
    public String deleteBooking(@RequestParam Integer id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Booking booking = bookingService.findById(id);
        
        // 检查是否是当前用户的预约
        if (booking != null && booking.getUserId().equals(user.getId())) {
            bookingService.deleteById(id);
        }
        return "redirect:/student/myBooking";
    }

    // 公告列表
    @GetMapping("/announcements")
    public String announcements(Model model) {
        List<Announcement> list = announcementService.findActive();
        model.addAttribute("announcements", list);
        return "announcement/list";
    }

    // 公告详情
    @GetMapping("/announcement/{id}")
    public String announcementDetail(@PathVariable Integer id, Model model) {
        Announcement announcement = announcementService.findById(id);
        model.addAttribute("announcement", announcement);
        return "announcement/detail";
    }

    // 跳转到异常申报页面
    @GetMapping("/anomaly")
    public String anomalyPage(Model model) {
        List<Court> courts = courtService.findAll();
        model.addAttribute("courts", courts);
        return "court/anomaly";
    }

    // 提交异常申报
    @PostMapping("/anomaly")
    public String submitAnomaly(@RequestParam("courtId") Integer courtId,
                                @RequestParam("description") String description,
                                HttpSession session) {
        User user = (User) session.getAttribute("user");
        Anomaly anomaly = new Anomaly(user.getId(), courtId, description);
        anomaly.setStatus("processing");
        anomalyService.createAnomaly(anomaly);
        return "redirect:/student/myAnomaly";
    }

    // 我的异常申报
    @GetMapping("/myAnomaly")
    public String myAnomaly(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Anomaly> list = anomalyService.findByUserId(user.getId());
        model.addAttribute("anomalies", list);
        return "court/my_anomaly";
    }
} 