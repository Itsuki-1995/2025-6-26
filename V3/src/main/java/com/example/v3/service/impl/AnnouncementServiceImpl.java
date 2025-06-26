package com.example.v3.service.impl;

import com.example.v3.mapper.AnnouncementMapper;
import com.example.v3.pojo.Announcement;
import com.example.v3.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public List<Announcement> findAll() {
        return announcementMapper.findAllWithDetails();
    }

    @Override
    public List<Announcement> findActive() {
        return announcementMapper.findActive();
    }

    @Override
    public Announcement findById(Integer id) {
        return announcementMapper.findById(id);
    }

    @Override
    public boolean createAnnouncement(Announcement announcement) {
        return announcementMapper.insert(announcement) > 0;
    }

    @Override
    public boolean updateAnnouncement(Announcement announcement) {
        return announcementMapper.update(announcement) > 0;
    }

    @Override
    public boolean deleteById(Integer id) {
        return announcementMapper.deleteById(id) > 0;
    }

    @Override
    public boolean updateStatus(Integer id, String status) {
        return announcementMapper.updateStatus(id, status) > 0;
    }

    @Override
    public List<Announcement> searchByTitle(String title) {
        return announcementMapper.searchByTitle(title);
    }
} 